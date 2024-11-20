import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

class UserDashboardPage extends StatelessWidget {
  UserDashboardPage({Key? key}) : super(key: key);

  final UserDashboardLogic logic = Get.put(UserDashboardLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[800],
        actions: [
          IconButton(
            icon: Icon(
              Icons.admin_panel_settings,
              color: Colors.white,
            ),
            onPressed: () {
              // Uncomment and implement navigation to the admin dashboard screen
              // Get.to(() => AdminDashboardScreen());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (logic.userList.isEmpty) {
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: logic.userList.length,
            itemBuilder: (context, i) {
              final data = logic.userList[i];
              return Card(
                color: Colors.blueGrey[800],
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data.imageUrl),
                    onBackgroundImageError: (_, __) => Icon(Icons.person),
                  ),
                  title: Text(
                    data.name,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    data.email,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
