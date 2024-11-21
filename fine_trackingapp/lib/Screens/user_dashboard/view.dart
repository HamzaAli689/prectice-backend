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
        title: const Text(
          'User Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              logic.getUsersFromFirebase(); // Refresh data on button press
            },
          ),
        ],
      ),
      body: Obx(() {
        if (logic.userList.isEmpty) {
          return const Center(
            child: Text(
              "No users found. Try refreshing.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          itemCount: logic.userList.length,
          itemBuilder: (context, index) {
            final user = logic.userList[index];

            return Card(
              color: Colors.blueGrey[800],
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.imageUrl),
                  onBackgroundImageError: (_, __) => const Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                subtitle: Text(
                  user.email,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
