// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class FineHistoryPage extends StatelessWidget {
//   const FineHistoryPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final userId = "user123"; // Replace with the current user's ID dynamically
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fine History'),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('users')
//             .doc(userId)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return const Center(
//               child: Text('No fine history available.'),
//             );
//           }
//
//           final userData = snapshot.data!.data() as Map<String, dynamic>;
//           final fines = userData['fines'] as List<dynamic>? ?? [];
//
//           if (fines.isEmpty) {
//             return const Center(
//               child: Text('No fine history available.'),
//             );
//           }
//
//           return ListView.builder(
//             itemCount: fines.length,
//             itemBuilder: (context, index) {
//               final fine = fines[index] as Map<String, dynamic>;
//               final amount = fine['amount'] as double;
//               final timestamp = fine['timestamp'] as Timestamp;
//
//               return ListTile(
//                 leading: const Icon(Icons.attach_money),
//                 title: Text('Fine: \$${amount.toStringAsFixed(2)}'),
//                 subtitle: Text('Date: ${timestamp.toDate()}'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
