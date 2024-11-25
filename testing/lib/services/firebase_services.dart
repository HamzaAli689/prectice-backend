import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/classess.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> recordFine(int minutesLate, String reason) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final ruleDoc = await _firestore.collection('rules').doc('current').get(); //Get current rules
    final rule = Rule.fromMap(ruleDoc.data()!);

    final fineAmount = calculateFine(minutesLate, rule);
    final fine = Fine(date: DateTime.now(), amount: fineAmount, reason: reason);


    await _firestore.collection('users1').doc(user.uid).update({
      'fineHistory': FieldValue.arrayUnion([fine.toMap()]),
      'lateCount': FieldValue.increment(1),
    });
  }


  Future<dynamic> getUserData() async {
    final user = _auth.currentUser;
    if (user == null) throw Exception("User not authenticated");
    final doc = await _firestore.collection('users').doc(user.uid).get();
    if(!doc.exists){
      await _firestore.collection('users').doc(user.uid).set({'lateCount': 0, 'fineHistory': [], 'fineLimitReached': false});
      return Users(uid: user.uid);
    }
    return Users.fromMap(user.uid, doc.data()!);
  }

  Future<Rule> getCurrentRules() async {
    final doc = await _firestore.collection('rules').doc('current').get();
    return Rule.fromMap(doc.data()!);
  }


  double calculateFine(int minutesLate, Rule rule) {
    double fine = rule.fineAmount * minutesLate;
    final user = _auth.currentUser;

    if(user == null) return fine;

    return fine;
  }

// Add methods for admin panel (setting rules, etc.)
}