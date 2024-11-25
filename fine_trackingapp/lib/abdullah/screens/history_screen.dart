import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryScreen extends StatelessWidget {
  final String studentId;
  const HistoryScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('students').doc(studentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No history available.'));
          }
          final data = snapshot.data!.data() as Map<String, dynamic>;
          final history = List<Map<String, dynamic>>.from(data['history']);

          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final entry = history[index];
              return ListTile(
                title: Text('Date: ${entry['date']}'),
                subtitle: Text('Minutes Late: ${entry['minutesLate']}'),
                trailing: Text('Fine: \$${entry['fine']}'),
              );
            },
          );
        },
      ),
    );
  }
}
