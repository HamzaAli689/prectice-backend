// import 'package:flutter/material.dart';
//
// class AdminPage extends StatelessWidget {
//   const AdminPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Admin Panel')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Set Fine Rate (per minute):',
//               style: TextStyle(fontSize: 18),
//             ),
//             TextField(
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 hintText: 'Enter fine rate',
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Set Late Limit:',
//               style: TextStyle(fontSize: 18),
//             ),
//             TextField(
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 hintText: 'Enter late limit',
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Save new fine rules to Firebase
//               },
//               child: const Text('Save Rules'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Reset late counts logic
//               },
//               child: const Text('Reset Late Counts'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
