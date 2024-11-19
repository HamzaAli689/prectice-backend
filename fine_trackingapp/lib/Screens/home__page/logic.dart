import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_PageLogic extends GetxController {

  var totalFines = 0.0.obs ;  // Observable state for total fines
  var lateCount = 0.obs;  // Observable state for late count
  var pendingFines = 0.0.obs;  // Observable state for pending fines
  var fineRate = 1.0.obs;  // Fine rate per minute (could be set by the admin)
  var lateLimit = 3.obs;  // Maximum lateness limit (could be set by the admin)

  final TextEditingController fineC = TextEditingController();

  final TextEditingController timeC = TextEditingController();


  // Method to update total fines based on lateness
  double calculateFine(int lateMinutes, double ratePerMinute, int lateLimit, int lateCount) {
    if (lateCount >= lateLimit) {
      return lateMinutes * ratePerMinute * 2; // Double the fine if late count exceeds the limit
    }
    return lateMinutes * ratePerMinute;  // Regular fine calculation
  }

  // Method to update fines
  void updateFines(int lateMinutes) {
    // Calculate fine based on current lateness
    double fine = calculateFine(lateMinutes, fineRate.value, lateLimit.value, lateCount.value);
    totalFines.value += fine;  // Update the total fines
    pendingFines.value += fine;  // Update pending fines as well
  }

  // Increment late count
  void incrementLateCount() {
    lateCount.value += 1;
  }

  // Reset late count for monthly reset
  void resetLateCount() {
    lateCount.value = 0;  // Reset late count
  }

  Future<String?> imagePicker(Uint8List image, String FolderPath) async {
    String fileName = "Hamza.jpg";
    try {
      final Reference ref =
      await FirebaseStorage.instance.ref().child(FolderPath).child(fileName);
      ref.putData(image);
      final String myDownload = await ref.getDownloadURL();
      print(myDownload);
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }

}
