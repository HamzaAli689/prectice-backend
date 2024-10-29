import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:test_second/Screens/home_Screen.dart';
import 'package:test_second/formpage/logic.dart';

class pickDetails extends StatefulWidget {
  const pickDetails({super.key});

  @override
  State<pickDetails> createState() => _pickDetailsState();
}

class _pickDetailsState extends State<pickDetails> {
  Uint8List? bytesFromPicker;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  if (kIsWeb) {
                    bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
                    setState(() {});
                  } else if (Platform.isAndroid || Platform.isIOS) {
                    print("This is android");
                  }
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red),
                  child: ClipOval(
                    child: bytesFromPicker == null
                        ? SizedBox()
                        : Image.memory(
                      bytesFromPicker!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: FormpageLogic().namecontroller,
                decoration: InputDecoration(
                    label: Text("Name"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  FormpageLogic().pushDataOnFirebase();
                 Imagepicker(bytesFromPicker!, "Hamza");
                  Get.to(HomeScreen());
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                        "Save Data",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



Future<String?> Imagepicker(Uint8List image, String folderPath) async {
  String fileName = "Hamza.jpg";
  try {
    final Reference ref =
    await FirebaseStorage.instance.ref().child(folderPath).child(fileName);
    ref.putData(image);
    String myDwonload = await ref.getDownloadURL();
    print(myDwonload);
  } on Exception catch (e) {
    print(e);
    // TODO
  }
}

