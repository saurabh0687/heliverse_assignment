import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heliverse_assignment/contollers/user_controllers.dart';

import 'package:heliverse_assignment/widgets/user_team_card.dart';

class TeamMembersScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final String domain;

  TeamMembersScreen({required this.domain});

  @override
  Widget build(BuildContext context) {
    final teamMembers = userController.teams[domain] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Team Members: $domain'),
      ),
      body: ListView.builder(
        itemCount: teamMembers.length,
        itemBuilder: (context, index) {
          final user = teamMembers[index];
          return TeamMemberCard(user: user);
        },
      ),
    );
  }
}

