import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_contoller.dart';
class StudentApp extends StatelessWidget {
  final StudentController controller = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Fine Manager'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.students.isEmpty) {
                  return const Center(child: Text('No students added.'));
                }
                return ListView.builder(
                  itemCount: controller.students.length,
                  itemBuilder: (context, index) {
                    final student = controller.students[index];
                    return ListTile(
                      title: Text(student['name']),
                      subtitle: Text('Fine: ${student['fine']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          controller.updateFine(
                              student['id'], student['fine'] + 10);
                        },
                      ),
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                          labelText: 'Enter student name'),
                      onSubmitted: (value) {
                        controller.addStudent(value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      final nameController = TextEditingController();
                      controller.addStudent(nameController.text);
                      nameController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
