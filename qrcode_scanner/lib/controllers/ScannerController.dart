import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScannerController extends GetxController {
  RxString scannedResult = ''.obs; // To store the scanned QR code result
  RxBool showScanner = true.obs; // To toggle between scanner and gallery mode
  RxString selectedImagePath = ''.obs; // To store the path of the selected image

  // Save scanned result to Firestore
  Future<void> saveToFirestore() async {
    if (scannedResult.isNotEmpty) {
      final collection = FirebaseFirestore.instance.collection('scanHistory');
      await collection.add({
        'result': scannedResult.value,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Get.snackbar('Success', 'QR Code saved to history.');
    } else {
      Get.snackbar('Error', 'No QR Code to save.');
    }
  }

  // Update scanned result and selected image
  void updateResultFromGallery(String result, String imagePath) {
    scannedResult.value = result;
    selectedImagePath.value = imagePath;
    showScanner.value = false; // Switch to result display mode
  }

  // Clear the scanned result and image
  void clearResult() {
    scannedResult.value = '';
    selectedImagePath.value = '';
    showScanner.value = true; // Switch back to scanner mode
  }
}
