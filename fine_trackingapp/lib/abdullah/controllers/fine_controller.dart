import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/sudent_model.dart';

class FineController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void calculateFine(Student student, int minutesLate) async {
    int fineRate = 5; // Default fine per minute
    int lateLimit = 5;

    // Check if the student has exceeded the late limit
    if (student.lateCount >= lateLimit) {
      fineRate *= 2; // Double the fine rate
    }

    int totalFine = minutesLate * fineRate;

    // Update student's data
    student.totalFines += totalFine;
    student.lateCount += 1;

    // Add to history
    student.history.add({
      'date': DateTime.now().toIso8601String(),
      'minutesLate': minutesLate,
      'fine': totalFine,
    });

    // Update in Firestore
    await _firestore.collection('students').doc(student.id).update(student.toMap());
  }

  void resetMonthlyData() async {
    final studentsCollection = _firestore.collection('students');
    final snapshot = await studentsCollection.get();

    for (var doc in snapshot.docs) {
      final student = Student.fromMap(doc.data());
      student.lateCount = 0; // Reset late count
      student.totalFines = 0; // Reset total fines
      await doc.reference.update(student.toMap());
    }
  }
}
