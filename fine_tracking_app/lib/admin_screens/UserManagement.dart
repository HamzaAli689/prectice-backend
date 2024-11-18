import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AdminController.dart';

class UserManagementScreen extends StatelessWidget {
  final AdminController adminController = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // Example user count
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('User #$index'),
              subtitle: Text('Total Fines: \$100, Late Count: 2'),
              trailing: Icon(Icons.edit),
              onTap: () {
                // Navigate to edit user fines screen
              },
            );
          },
        ),
      ),
    );
  }
}
