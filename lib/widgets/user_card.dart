import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heliverse_assignment/contollers/user_controllers.dart';
import 'package:heliverse_assignment/model/user_model.dart';
class UserCard extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final UserModel user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green],
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
                radius: 40,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${user.first_name} ${user.last_name}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          user.email,
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis, 
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Text('Gender: ${user.gender}', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.business,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Text('Domain: ${user.domain}', style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Icon(
                        user.availability ? Icons.check : Icons.close,
                        color: Colors.black,
                      ),
                     const SizedBox(width: 8),
                      Text(
                        'Availability: ${user.availability ? "Available" : "Not Available"}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  ElevatedButton(
                        onPressed: () {
                         userController.addToTeam(user);
                        },
                        child: const Text('Add to Team', style: TextStyle(color: Colors.white)),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}