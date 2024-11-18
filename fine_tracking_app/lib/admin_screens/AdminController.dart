import 'package:get/get.dart';

class AdminController extends GetxController {
  var totalFines = 0.0.obs;  // Total fines
  var pendingFines = 0.0.obs;  // Pending fines
  var averageLateness = 0.0.obs;  // Average lateness time
  var fineRate = 0.0.obs;  // Fine rate per minute
  var maxLatenessLimit = 0.obs;  // Maximum lateness limit in minutes

  // Add methods to update these values
  void updateTotalFines(double amount) {
    totalFines.value += amount;
  }

  void updatePendingFines(double amount) {
    pendingFines.value = amount;
  }

  void updateAverageLateness(double time) {
    averageLateness.value = time;
  }

  // Method to update fine rate
  void updateFineRate(double rate) {
    fineRate.value = rate;  // Update fine rate
  }

  // Method to update maximum lateness limit
  void updateMaxLatenessLimit(int limit) {
    maxLatenessLimit.value = limit;  // Update max lateness limit
  }
}
