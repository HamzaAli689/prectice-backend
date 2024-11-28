import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_tools/qr_code_tools.dart';

import '../controllers/ScannerController.dart';
import '../controllers/ThemeController.dart';


class QRScannerScreen extends StatelessWidget {
  final ScannerController scannerController = Get.put(ScannerController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => Get.find<ThemeController>().toggleTheme(),
          ),
        ],
      ),
      body: Obx(() {
        if (scannerController.selectedImagePath.isNotEmpty) {
          // Display the selected image and scanned result
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.file(
                  File(scannerController.selectedImagePath.value),
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  'Result: ${scannerController.scannedResult.value}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => scannerController.saveToFirestore(),
                  child: const Text('Save to History'),
                ),
                ElevatedButton(
                  onPressed: () => scannerController.clearResult(),
                  child: const Text('Scan Again'),
                ),
              ],
            ),
          );
        } else if (scannerController.scannedResult.isNotEmpty) {
          // Show only the scanned result
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Result: ${scannerController.scannedResult.value}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () => scannerController.saveToFirestore(),
                  child: const Text('Save to History'),
                ),
                ElevatedButton(
                  onPressed: () => scannerController.clearResult(),
                  child: const Text('Scan Again'),
                ),
              ],
            ),
          );
        } else {
          // Show the scanner or gallery picker
          return Column(
            children: [
              Expanded(
                flex: 5,
                child: scannerController.showScanner.value
                    ? Stack(
                  alignment: Alignment.center,
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: (controller) {
                        controller.scannedDataStream.listen((scanData) {
                          scannerController.updateResultFromGallery(
                              scanData.code!, '');
                        });
                      },
                    ),
                    Lottie.asset(
                      'assets/Animation-Scanner.json',
                      width: 200,
                      height: 200,
                    ),
                  ],
                )
                    : Center(
                  child: Lottie.asset(
                    'assets/Animation-Scanner.json',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => pickImageFromGallery(),
                      child: const Text('Pick from Gallery'),
                    ),
                    ElevatedButton(
                      onPressed: () => scannerController.clearResult(),
                      child: const Text('Open Scanner'),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  // Pick Image from Gallery and Decode QR
  Future<void> pickImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      try {
        String? result = await QrCodeToolsPlugin.decodeFrom(pickedFile.path);
        if (result != null && result.isNotEmpty) {
          scannerController.updateResultFromGallery(result, pickedFile.path);
        } else {
          Get.snackbar('Error', 'No QR code found in the image');
        }
      } catch (e) {
        Get.snackbar('Error', 'Failed to decode QR code from image');
      }
    }
  }
}
