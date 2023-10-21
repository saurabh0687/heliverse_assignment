import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heliverse_assignment/contollers/user_controllers.dart';
import 'package:heliverse_assignment/model/user_model.dart';

class TeamMemberCard extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final UserModel user;

  TeamMemberCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
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
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
                radius: 40,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    const  Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${user.first_name} ${user.last_name}',
                        style:const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                    const  Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                    const SizedBox(width: 8),
                      Text('Gender: ${user.gender}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                     const Icon(
                        Icons.business,
                        color: Colors.black,
                      ),
                     const SizedBox(width: 8),
                      Text('Domain: ${user.domain}',
                          style: const TextStyle(color: Colors.white)),
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
                        style:const TextStyle(color: Colors.white),
                      ),
                    ],
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











      // body: ListView.builder(
      //   itemCount: usersToShow.length,
      //   itemBuilder: (context, index) {
      //     final user = usersToShow[index];
      //     return UserCard(user: user);
      //   },
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     children: [
      //       IconButton(
      //         icon: Icon(Icons.arrow_back),
      //         onPressed: () {
      //           userController.previousPage();
      //         },
      //       ),
      //       Text('Page ${userController.currentPage + 1}'),
      //       IconButton(
      //         icon: Icon(Icons.arrow_forward),
      //         onPressed: () {
      //           userController.nextPage();
      //         },
      //       ),



//        Widget build(BuildContext context) {
//     final startIndex  = userController.currentPage * 10;
//     final endIndex = min(startIndex + 10, userController.users.length);
//     final usersToShow = userController.filteredUsers(startIndex as int, endIndex as int?);

//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('User List'),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.filter_list),
//           onPressed: () {
//             _scaffoldKey.currentState!.openDrawer();
//           },
//         ),
//         actions: [
//           // Filter button

//         TextButton(
//   onPressed: () {
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => TeamListScreen(),
//     ));
//   },
//   child: Text('View Teams', style: TextStyle(color: Colors.white)),
// )

//         ],
//       ),
//       drawer: FilterDrawer(),// Add the FilterDrawer widget
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 // Search box
//                 Expanded(
//                   child: TextField(
//                     onChanged: (query) {
//                       userController.search(query);
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Search by Name',
//                       prefixIcon: Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Obx(
//               () {
//                 if (userController.isLoading.value) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   return ListView.builder(
//         itemCount: usersToShow.length,
//         itemBuilder: (context, index) {
//           final user = usersToShow[index];
//           return UserCard(user: user);
//         },
//       );
      
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           children: [
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 userController.previousPage();
//               },
//             ),
//             Text('Page ${userController.currentPage + 1}'),
//             IconButton(
//               icon: Icon(Icons.arrow_forward),
//               onPressed: () {
//                 userController.nextPage();
//               },
//             ),
//           ]
//     ),
//       )
//     );
//   }
// }
