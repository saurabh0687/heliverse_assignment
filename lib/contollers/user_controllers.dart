// user_controller.dart
import 'dart:convert';

import 'package:get/get.dart';
import 'package:heliverse_assignment/model/user_model.dart';

import '../utils/json.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var users = <UserModel>[].obs;
  var filteredUsers = <UserModel>[].obs;
  var selectedGender = "".obs;
  var selectedDomain = "".obs;
  final isAvailable = false.obs;
  final isNotAvailable = false.obs;
  final itemsPerPage = 10.obs;
  final currentPage = 0.obs;
  RxBool noMoreData = false.obs;
  RxList<UserModel> searchedUsers = <UserModel>[].obs;
  RxBool isSearching = false.obs;

  @override
  void onInit() {
    loadUsers();
    super.onInit();
  }

  void loadUsers() async {
    await Future.delayed(Duration(seconds: 2));

    final List<dynamic> jsonList = json.decode(jsonData);
    users.assignAll(jsonList.map((json) => UserModel.fromJson(json)));

    filteredUsers.assignAll(users);
    isLoading.value = false;
  }

  void applyFilters() {
    filteredUsers.assignAll(users.where((user) {
      bool genderMatch =
          selectedGender.isEmpty || user.gender == selectedGender.value;
      bool domainMatch =
          selectedDomain.isEmpty || user.domain == selectedDomain.value;
      bool availabilityMatch = !isAvailable.value || user.availability;

      return genderMatch && domainMatch && availabilityMatch;
    }));
    currentPage.value = 0;
    if (filteredUsers.isEmpty) {
      noMoreData.value = true;
    } else {
      noMoreData.value = false;
    }
  }

  void setGenderFilter(String gender) {
    selectedGender.value = gender;
    applyFilters();
  }

  void setDomainFilter(String domain) {
    selectedDomain.value = domain;
    applyFilters();
  }

  void setAvailabilityFilter(bool available, bool notAvailable) {
    isAvailable.value = available;
    isNotAvailable.value = notAvailable;
    applyFilters();
  }

  List<UserModel> filterUsers() {
    return users.where((user) {
      if (isAvailable.value && isNotAvailable.value) {
        return true;
      } else if (isAvailable.value) {
        return user.availability == "Available";
      } else if (isNotAvailable.value) {
        return user.availability == "Not Available";
      }
      return true;
    }).toList();
  }

  final Map<String, List<UserModel>> teams = {};
  void addToTeam(UserModel user) {
    if (user.availability == true) {
      final domain = user.domain;
      if (teams.containsKey(domain)) {
        if (!teams[domain]!.contains(user)) {
          teams[domain]!.add(user);
        }
      } else {
        teams[domain] = [user];
      }
    } else {
      Get.snackbar(
          'User Not Available', 'This user is not available for the team.');
    }
  }

  List<String> extractUniqueDomains() {
    List<String> uniqueDomains =
        users.map((user) => user.domain).toSet().toList();
    uniqueDomains.insert(0, "None");
    return uniqueDomains;
  }

  void search(String query) {
    isSearching.value = true;
    if (query.isEmpty) {
      searchedUsers.assignAll(users);
    } else {
      final queryLower = query.toLowerCase();

      searchedUsers.assignAll(users.where((user) {
        final fullName = '${user.first_name} ${user.last_name}'.toLowerCase();

        return fullName.contains(queryLower);
      }));
    }
    currentPage.value = 0;
  }

  List<UserModel> getUsersForCurrentPage() {
    final startIndex = currentPage.value * itemsPerPage.value;
    int endIndex = (currentPage.value + 1) * itemsPerPage.value;

    if (!isSearching.value) {
      if (startIndex >= filteredUsers.length) {
        return [];
      }

      if (endIndex >= filteredUsers.length) {
        endIndex = filteredUsers.length;
      }

      return filteredUsers.sublist(startIndex, endIndex);
    } else {
      return searchedUsers;
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void goToNextPage() {
    final totalPages = (filteredUsers.length / itemsPerPage.value).ceil();
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
    }
    if (noMoreData.value) {
      resetToStartingPage();
    }
  }

  void resetToStartingPage() {
    currentPage.value = 0;
    noMoreData.value = false;
    applyFilters();
  }
}
