// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/sudent_model.dart';
//
// class StudentController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   var students = <Student>[].obs;
//
//   void fetchStudents() async {
//     final snapshot = await _firestore.collection('students').get();
//     students.value = snapshot.docs
//         .map((doc) => Student.fromMap(doc.data() as Map<String, dynamic>))
//         .toList();
//   }
//
//   void addStudent(String name) async {
//     final docRef = _firestore.collection('students').doc();
//     final student = Student(
//       id: docRef.id,
//       name: name,
//       totalFines: 0,
//       lateCount: 0,
//       history: [],
//     );
//     await docRef.set(student.toMap());
//     students.add(student);
//   }
// }
import 'package:get/get.dart';

import '../screens/firebase_service.dart';

class StudentController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  var students = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  Future<void> fetchStudents() async {
    students.value = await _firebaseService.getStudents();
  }

  Future<void> addStudent(String name) async {
    await _firebaseService.addStudent({'name': name, 'fine': 0});
    fetchStudents();
  }

  Future<void> updateFine(String studentId, int fine) async {
    await _firebaseService.updateFine(studentId, fine);
    fetchStudents();
  }
}
