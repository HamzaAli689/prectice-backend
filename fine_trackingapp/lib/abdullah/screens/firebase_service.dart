import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addStudent(Map<String, dynamic> studentData) async {
    await _firestore.collection('students').add(studentData);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final querySnapshot = await _firestore.collection('students').get();
    return querySnapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data()})
        .toList();
  }

  Future<void> updateFine(String studentId, int fine) async {
    await _firestore
        .collection('students')
        .doc(studentId)
        .update({'fine': fine});
  }
}
