import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heliverse_assignment/contollers/user_controllers.dart';
import 'package:heliverse_assignment/screens/team_list.dart';
import 'package:heliverse_assignment/widgets/user_card.dart';

import '../widgets/filter_drawer.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final UserController userController = Get.put(UserController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'User List',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TeamListScreen(),
              ));
            },
            child: const Text('View Teams',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
      drawer: FilterDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (query) {
                      userController.search(query);
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'Search by Name',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              final users = userController.getUsersForCurrentPage();
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserCard(user: user);
                },
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                userController.goToPreviousPage();
                setState(() {});
              },
              child: const Text('Previous'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Text(
              "Page: ${userController.currentPage.value}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                userController.goToNextPage();
                setState(() {});
              },
              child: const Text('Next'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }
}
