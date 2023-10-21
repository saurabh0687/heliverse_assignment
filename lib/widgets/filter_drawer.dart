import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heliverse_assignment/contollers/user_controllers.dart';

class FilterDrawer extends StatefulWidget {
  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final UserController userController = Get.find<UserController>();

void applyAllFilters() {
    setState(() {});
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Filters'),
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          ListTile(
            title: Text('Gender'),
            trailing: DropdownButton<String>(
              value: userController.selectedGender.value.isNotEmpty
                  ? userController.selectedGender.value
                  : 'None', 
           
              onChanged: (String? newValue) {
                if (newValue != 'None') {
                  userController.setGenderFilter(newValue!);
                  setState(() {
                    
                  });
                } else {
                  userController
                      .setGenderFilter('');
                      setState(() {
                        
                      });
                }
              },
              items: <String>['None', 'Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
          ),
          ListTile(
            title: Text('Domain'),
            trailing: DropdownButton<String>(
              value: userController.selectedDomain.value.isNotEmpty
                  ? userController.selectedDomain.value
                  : 'None', 
              onChanged: (String? newValue) {
                if (newValue != 'None') {
                  userController.setDomainFilter(newValue!);
                  setState(() {
                
                  });
                } else {
                  userController
                      .setDomainFilter('');
                      setState(() {
                        
                      }); 
                }
              },
              items: userController.extractUniqueDomains()
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
          ),
          CheckboxListTile(
            title: Text('Available'),
            value: userController.isAvailable.value,
            onChanged: (bool? newValue) {
              userController.setAvailabilityFilter(newValue!,false);
              setState(() {
                
              });
            },
          ),
    
            ElevatedButton(
              onPressed: applyAllFilters,
              child: Text('Apply'),
            ),
        ],
      ),
     
    );
  }
}
