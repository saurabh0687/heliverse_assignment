
class UserModel {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String gender;
  final String avatar;
  final String domain;
  final bool availability;

  UserModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.gender,
    required this.avatar,
    required this.domain,
    required this.availability,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      avatar: json['avatar'],
      domain: json['domain'],
      availability: json['available'],
    );
  }
}
