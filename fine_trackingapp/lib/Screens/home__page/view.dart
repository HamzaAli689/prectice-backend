import 'dart:io';

import 'package:fine_trackingapp/Screens/user_dashboard/view.dart';
import 'package:fine_trackingapp/widgets/my_buttons.dart';
import 'package:fine_trackingapp/widgets/mytext_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'logic.dart';

class Home_Page extends StatefulWidget {
  Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final Home_PageLogic logic = Get.put(Home_PageLogic());

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
              Get.to(() => User_dashboardPage()); // Navigate to UserDashboard
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
                  setState(() {

                  });
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
                MytextFields(lable: 'Fine per minute', mycontroller: logic.fineC, obscureText: false),
                const SizedBox(height: 25),
                MytextFields(lable: 'Time (minutes)', mycontroller: logic.timeC, obscureText: false),
                const SizedBox(height: 25),
                MyButtons(onpress: (){
                    logic.imagePicker(bytesFromPicker!, "Hamza");
                    // Get values from input fields
                    double finePerMinute =
                        double.tryParse(logic.fineC.text) ?? 0.0;
                    int lateMinutes = int.tryParse(logic.timeC.text) ?? 0;

                    // Update the fine calculation in the UserController
                    logic.fineRate.value = finePerMinute;
                    logic.updateFines(lateMinutes);

                    // Navigate to the UserDashboard to show the total fine
                    Get.to(() => User_dashboardPage());

                }, title: "Calculate")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
