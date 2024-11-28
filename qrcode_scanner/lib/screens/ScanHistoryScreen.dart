import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/HistoryController.dart';

class ScanHistoryScreen extends StatelessWidget {
  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan History')),
      body: StreamBuilder(
        stream: historyController.getHistoryStream(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['result'] ?? ''),
                subtitle: Text(
                  data['timestamp']?.toDate().toString() ?? '',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
