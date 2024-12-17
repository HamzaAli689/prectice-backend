import 'dart:io';
import 'dart:typed_data';

import 'package:dispute_resolver_ai/screens/common_widgets/text_fields.dart';
import 'package:dispute_resolver_ai/utilites/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../common_widgets/buttons.dart';
import 'logic.dart';

class LoginScreenPage extends StatefulWidget {
  LoginScreenPage({Key? key}) : super(key: key);

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final Login_screenLogic logic = Get.put(Login_screenLogic());
  Uint8List? bytesFromPicker;

  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveBreakpoints.of(context);

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: screenType.largerThan(TABLET)
          ? showWebLoginScreen(context)
          : screenType.largerThan(MOBILE)
          ? showTabLoginScreen(context)
          : showMobileLoginScreen(context),
    );
  }

  Widget showMobileLoginScreen(BuildContext context) {
    return myForm(context);
  }

  Widget showTabLoginScreen(BuildContext context) {
    return myForm(context);
  }

  Widget showWebLoginScreen(BuildContext context) {
    return myForm(context);
  }

  Widget myForm(BuildContext context) {
    return Obx(() {
      return logic.issignin.value
          ? mySignInForm(context)
          : mySignUpForm(context);
    });
  }

  Widget mySignInForm(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(16),
          Text(
            "My Sign IN Form",
            style: mytextstyles.textStyle1L,
          ),
          const Gap(16),
          myText_fields(
            mycontroller: logic.emailC,
            lable: 'Enter Email',
          ),
          const Gap(16),
          myText_fields(
            mycontroller: logic.passcontroller,
            lable: 'Enter Password',
          ),
          const Gap(16),
          mybuttons(
            myfunction: () async {
              await logic.loginUser();
              print("User logged in successfully");
            },
            mybtnwidget: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.ads_click), Gap(6), Text("SignIN")],
            ),
          ),
          const Gap(16),
          TextButton(
            onPressed: () {
              logic.issignin.value = !logic.issignin.value;
            },
            child: Text(
              "Not Signed In? Sign Up",
              style: mytextstyles.textStyle2M,
            ),
          ),
        ],
      ),
    );
  }

  Widget mySignUpForm(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(16),
          Text(
            "My Sign UP Form",
            style: mytextstyles.textStyle1L,
          ),
          const Gap(16),
          InkWell(
            onTap: () async {
              if (kIsWeb) {
                bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
                setState(() {});
              } else if (Platform.isAndroid || Platform.isIOS) {
                print("This is a mobile platform");
                // Implement mobile image picker if needed
              }
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipOval(
                child: bytesFromPicker == null
                    ? const SizedBox()
                    : Image.memory(
                  bytesFromPicker!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Gap(16),
          myText_fields(
            mycontroller: logic.usercontroller,
            lable: 'Enter User Name',
          ),
          const Gap(16),
          myText_fields(
            mycontroller: logic.emailC,
            lable: 'Enter Email',
          ),
          const Gap(16),
          myText_fields(
            mycontroller: logic.passcontroller,
            lable: 'Enter Password',
          ),
          const Gap(16),
          mybuttons(
            myfunction: () async {
              if (bytesFromPicker != null) {
                String? profileImageUrl =
                await uploadImage(bytesFromPicker!, "myProfileImages${logic.usercontroller.text}");
                if (profileImageUrl != null) {
                  await logic.createUserOnFirebase(profileImageUrl);
                } else {
                  print("Image couldn't be uploaded");
                }
              } else {
                print("No image selected");
              }
            },
            mybtnwidget: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.ads_click), Gap(6), Text("SignUP")],
            ),
          ),
          const Gap(16),
          TextButton(
            onPressed: () {
              logic.issignin.value = !logic.issignin.value;
            },
            child: Text(
              "Already Signed Up? Sign In",
              style: mytextstyles.textStyle2M,
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> uploadImage(Uint8List image, String folderPath) async {
    try {
      final Reference ref = FirebaseStorage.instance
          .ref()
          .child(folderPath)
          .child("HamzaAli.jpg");
      await ref.putData(image);
      final String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }
}
