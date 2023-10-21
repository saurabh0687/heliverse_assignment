import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heliverse_assignment/screens/team_details.dart';

import '../contollers/user_controllers.dart';

class TeamListScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

   TeamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: ListView.builder(
        itemCount: userController.teams.length,
        itemBuilder: (context, index) {
          final domain = userController.teams.keys.elementAt(index);
          final teamMembers = userController.teams[domain] ?? [];

          return Card(
            margin: const EdgeInsets.all(8),
            color: Colors.blue,
            child: ListTile(
              title: Text(
                'Team: $domain',
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: Chip(
                backgroundColor: Colors.green, 
                label: Text(
                  'Members: ${teamMembers.length}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TeamMembersScreen(domain: domain),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
