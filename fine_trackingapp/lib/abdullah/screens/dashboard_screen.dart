// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/student_contoller.dart';
// import 'add_studentScreen.dart';
// import 'history_screen.dart';
//
// class DashboardScreen extends StatelessWidget {
//   final studentController = Get.find<StudentController>();
//
//   DashboardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Dashboard'),
//       ),
//       body: Obx(() {
//         if (studentController.students.isEmpty) {
//           return Center(child: Text('No students available.'));
//         }
//         return ListView.builder(
//           itemCount: studentController.students.length,
//           itemBuilder: (context, index) {
//             final student = studentController.students[index];
//             return ListTile(
//               title: Text(student.name),
//               subtitle: Text('Total Fines: \$${student.totalFines}'),
//               trailing: Text('Late Count: ${student.lateCount}'),
//               onTap: () {
//                 // Navigate to history screen for this student
//                 Get.to(() => HistoryScreen(studentId: student.id));
//               },
//             );
//           },
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(() => AddStudentScreen());
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
