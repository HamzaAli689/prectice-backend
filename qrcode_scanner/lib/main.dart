import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_scanner/screens/QRScannerScreen.dart';
import 'controllers/ThemeController.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Scanner',
      initialBinding: BindingsBuilder(() {
        Get.put(ThemeController());
      }),
      themeMode: Get.find<ThemeController>().themeMode.value,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: QRScannerScreen(),
    );
  }
}

