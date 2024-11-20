import 'package:flutter/material.dart';

Widget MyCard(String title, String subtitle, IconData icon) {
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