import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'user_controller.dart';
import 'user_dashboard.dart'; // Add the dashboard screen

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController userController = Get.put(UserController());

  // GetX controller
  final TextEditingController fineController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  Uint8List? bytesFromPicker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[800],
        actions: [
          IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => UserDashboard()); // Navigate to UserDashboard
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                if (kIsWeb) {
                  bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
                  setState(() {});
                } else if (Platform.isAndroid || Platform.isIOS) {
                  print("This is Android");
                }
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: bytesFromPicker == null?SizedBox():Image.memory(bytesFromPicker!),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                TextField(
                  controller: fineController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Fine per minute',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyanAccent),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: timeController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Time (minutes)',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyanAccent),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    imagePicker(bytesFromPicker!, "Hamza");
                    // Get values from input fields
                    double finePerMinute =
                        double.tryParse(fineController.text) ?? 0.0;
                    int lateMinutes = int.tryParse(timeController.text) ?? 0;

                    // Update the fine calculation in the UserController
                    userController.fineRate.value = finePerMinute;
                    userController.updateFines(lateMinutes);

                    // Navigate to the UserDashboard to show the total fine
                    Get.to(() => UserDashboard());
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.cyanAccent, Colors.blueAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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
