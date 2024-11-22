import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanelLogic extends GetxController {
  var fineRate = 0.0.obs; // Observable for fine per minute
  var lateLimit = 0.obs;  // Observable for late time limit

  TextEditingController fineC = TextEditingController();
  TextEditingController lateC = TextEditingController();

  // Method to update fine and late limit in Firestore and create a sub-collection
  Future<void> updateFineAndLateLimit() async {
    try {
      double finePerMinute = double.tryParse(fineC.text) ?? 0.0;
      int lateTimeLimit = int.tryParse(lateC.text) ?? 0;

      // // Validate inputs
      // if (finePerMinute == 0 || lateTimeLimit <= 0) {
      //   Get.snackbar('Error', 'Values must be greater than 0.');
      //   return;
      // }

      // Save fine rules to the `rules` document
      await FirebaseFirestore.instance
          .collection('users')
          .doc('rules') // Global rules document
          .set({
        'finePerMinute': finePerMinute,
        'lateTimeLimit': lateTimeLimit,
      });

      // Add a sub-collection named "details" in the `rules` document
      await FirebaseFirestore.instance
          .collection('users')
          .doc('rules')
          .collection('details') // Sub-collection
          .add({
        'timestamp': FieldValue.serverTimestamp(),
        'description': 'Initial fine and late limit set.',
        'finePerMinute': finePerMinute,
        'lateTimeLimit': lateTimeLimit,
      });

      // Update local observables
      fineRate.value = finePerMinute;
      lateLimit.value = lateTimeLimit;

      // Show confirmation
      Get.snackbar('Success', 'Fine rate and late limit updated!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update fine and late limit: $e');
    }
  }

  // Fetch rules from Firestore
  Future<void> fetchRules() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc('rules').get();
      if (doc.exists) {
        fineRate.value = doc['finePerMinute'] ?? 0.0;
        lateLimit.value = doc['lateTimeLimit'] ?? 0;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch rules: $e');
    }
  }
}
