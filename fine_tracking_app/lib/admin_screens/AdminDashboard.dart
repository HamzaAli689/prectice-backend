import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AdminController.dart';

class AdminDashboardScreen extends StatelessWidget {
  final AdminController adminController = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Analytics cards for lateness trends and fine distribution
            Obx(() {
              return Column(
                children: [
                  _buildCard('Total Fines', '\$${adminController.totalFines.value}', Icons.money),
                  _buildCard('Lateness Trends', 'Average: ${adminController.averageLateness.value} mins', Icons.access_time),
                  _buildCard('Fine Distribution', 'Pending: \$${adminController.pendingFines.value}', Icons.pie_chart),
                ],
              );
            }),
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
