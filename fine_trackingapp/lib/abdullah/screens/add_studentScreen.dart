import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_contoller.dart';

class AddStudentScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final studentController = Get.find<StudentController>();

  AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Student Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  studentController.addStudent(nameController.text);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Please enter a valid name');
                }
              },
              child: const Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}
