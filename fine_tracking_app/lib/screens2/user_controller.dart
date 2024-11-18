import 'package:get/get.dart';

class UserController extends GetxController {
  var totalFines = 0.0.obs; // Observable state for total fines
  var pendingFines = 0.0.obs; // Observable state for pending fines
  var lateCount = 0.obs; // Observable state for late count

  // Update total fines
  void updateFines(double amount) {
    totalFines.value += amount;
  }

  // Increment late count
  void incrementLateCount() {
    lateCount.value += 1;
  }

  // Reset late count
  void resetLateCount() {
    lateCount.value = 0;
  }

  // Update pending fines
  void updatePendingFines(double amount) {
    pendingFines.value = amount; // Set pending fines to a new value
  }
}
