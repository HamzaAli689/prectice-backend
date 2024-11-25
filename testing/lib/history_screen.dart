import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fine History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('fineHistory').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No history available'),
            );
          }

          final history = snapshot.data!.docs;

          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final data = history[index].data() as Map<String, dynamic>;
              final user = data['user'] ?? 'Unknown';
              final fineAmount = data['fineAmount'] ?? 0;
              final date = (data['date'] as Timestamp).toDate();

              return ListTile(
                title: Text('User: $user'),
                subtitle: Text('Fine: \$${fineAmount.toString()}'),
                trailing: Text(
                  '${date.day}/${date.month}/${date.year}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
