// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'fine_history_page.dart';
// import 'admin_page.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fine Manager'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.admin_panel_settings),
//             onPressed: () => Get.to(() => const AdminPage()),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => Get.to(() => const FineHistoryPage()),
//               child: const Text('View Fine History'),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Total Fines: \$100', // Replace with dynamic data
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Late Count: 3', // Replace with dynamic data
//               style: const TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
