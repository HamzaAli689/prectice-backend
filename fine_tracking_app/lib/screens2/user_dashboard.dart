import 'package:fine_tracking_app/screens2/pending_fines.dart';
import 'package:fine_tracking_app/screens2/total_fine.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'late_count_screen.dart'; // Import the Late Count Screen
import 'history_page.dart'; // Import the History Page
import 'user_controller.dart'; // Assuming this is your controller

class UserDashboard extends StatelessWidget {
  final UserController userController = Get.put(UserController()); // GetX controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blueGrey[800],
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to Notification Center (You can implement this screen similarly)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Obx(() {
                      return Text(
                        'Total Fines: \$${userController.totalFines.value}',
                        style: TextStyle(color: Colors.white70),
                      );
                    }),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(TotalFinesScreen());
                    },
                    child: _buildCard('Total Fines', '\$${userController.totalFines.value}', Icons.money),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(PendingFinesScreen());
                    },
                    child: _buildCard('Pending Fines', '\$40', Icons.pending),
                  ),
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        Get.to(LateCountScreen());
                      },
                      child: _buildCard('Late Count', '${userController.lateCount.value}', Icons.alarm),
                    );
                  }),
                  GestureDetector(
                    onTap: () {
                      Get.to(HistoryPage());
                    },
                    child: _buildCard('Fine History', 'Details', Icons.history),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, IconData icon) {
    return Card(
      color: Colors.blueGrey[800],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.cyanAccent, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
