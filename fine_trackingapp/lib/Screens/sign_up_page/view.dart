import 'dart:io';

import 'package:fine_trackingapp/Screens/login__page/view.dart';
import 'package:fine_trackingapp/widgets/my_buttons.dart';
import 'package:fine_trackingapp/widgets/mytext_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'logic.dart';

class SignUp_page extends StatefulWidget {
  SignUp_page({Key? key}) : super(key: key);

  @override
  State<SignUp_page> createState() => _SignUp_pageState();
}

class _SignUp_pageState extends State<SignUp_page> {
  final SignUpPageLogic logic = Get.put(SignUpPageLogic());

  Uint8List? bytesFromPicker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
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
                            child: ClipOval(
                              child: bytesFromPicker == null
                                  ? SizedBox()
                                  : Image.memory(bytesFromPicker!),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        MytextFields(lable: "User Name", mycontroller: logic.nameCS, obscureText: false),
                         const SizedBox(height: 15),
                        MytextFields(lable: "Email", mycontroller: logic.emailCS, obscureText: false),
                        const SizedBox(height: 15),
                        MytextFields(lable: "Password", mycontroller: logic.passwordCS, obscureText: true),
                        const SizedBox(height: 20),
                        MyButtons(onpress: ()async{
                          String? imageUrl= await logic.imagePicker(bytesFromPicker!, "Hamza");

                          if(imageUrl != null){
                            logic.createUserOnFirebase(imageUrl);
                          }
                          Get.snackbar("SignUp", "SignUp Successfully");
                        }, title: "Sign UP"),
                         SizedBox(height: 10),
                        TextButton(
                          onPressed: (){
                            Get.to(() => Login_Page());
                          },
                          child: const Text(
                            'Already hav an account? Sign In',
                            style: TextStyle(color: Colors.cyanAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
