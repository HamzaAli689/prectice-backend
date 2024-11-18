import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AdminController.dart';

class RuleManagerScreen extends StatelessWidget {
  final AdminController adminController = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rule Manager'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set Fine Rates',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Fine Rate (per minute)',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyanAccent),
                ),
              ),
              onChanged: (value) {
                // Logic to update the fine rate (example)
                double fineRate = double.tryParse(value) ?? 0.0;
                adminController.updateFineRate(fineRate);
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Set Maximum Lateness Limit',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Max Lateness Limit (minutes)',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyanAccent),
                ),
              ),
              onChanged: (value) {
                // Logic to update the max lateness limit (example)
                int maxLatenessLimit = int.tryParse(value) ?? 0;
                adminController.updateMaxLatenessLimit(maxLatenessLimit);
              },
            ),
          ],
        ),
      ),
    );
  }
}
