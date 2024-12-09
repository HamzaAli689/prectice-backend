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

  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveBreakpoints.of(context);

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: screenType.largerThan(TABLET)
            ? showWebLoginScreen(context)
            : screenType.largerThan(MOBILE)
                ? showTabLoginScreen(context)
                : showMobileLoginScreen(context),
      ),
    );
  }

  Widget showMobileLoginScreen(BuildContext context) {
    return myForm(context);
  }

  Widget showTabLoginScreen(context) {
    return myForm(context);
  }

  Widget showWebLoginScreen(context) {
    return myForm(context);
  }

  myForm(context) {
    return Obx(() {
      return logic.issignin.value
          ? mySignInForm(context)
          : mySignUpForm(context);
    });
  }

  mySignInForm(context) {
    return Center(
      child: Column(
        children: [
          Gap(16),
          Text(
            "My Sign IN Form",
            style: mytextstyles.textStyle1L,
          ),
          Gap(16),
          myText_fields(
            mycontroller: logic.emailcontroller,
            lable: 'Enter Email',
          ),
          Gap(16),
          myText_fields(
            mycontroller: logic.passcontroller,
            lable: 'Enter Password',
          ),
          Gap(16),
          mybuttons(
            myfunction: () async {
              print("My email is ${logic.emailcontroller.text}");
              print("My Password is ${logic.passcontroller.text}");
              await logic.loginUser();

              print("User login Successfully");
            },
            mybtnwidget: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.ads_click), Gap(6), Text("SignIN")],
            ),
          ),
          Gap(16),
          TextButton(
              onPressed: () {
                logic.issignin.value = !logic.issignin.value;
              },
              child: Text(
                "Not Signed In? Signed UP",
                style: mytextstyles.textStyle2M,
              )),
        ],
      ),
    );
  }

  Uint8List? bytesFromPicker;

  mySignUpForm(context) {
    return Center(
      child: Column(
        children: [
          Gap(16),
          Text(
            "My Sign UP Form",
            style: mytextstyles.textStyle1L,
          ),
          Gap(16),
          InkWell(
            onTap: () async {
              if (kIsWeb) {
                bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
                setState(() {});
              } else if (Platform.isAndroid || Platform.isIOS) {
                print("This is android Mobile");
              }
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(100)),
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
          const Gap(16),
          myText_fields(
            mycontroller: logic.usercontroller,
            lable: 'Enter User Name',
          ),
          const Gap(16),
          myText_fields(
            mycontroller: logic.emailcontroller,
            lable: 'Enter Email',
          ),
          const Gap(16),
          myText_fields(
            mycontroller: logic.passcontroller,
            lable: 'Enter Password',
          ),
          Gap(16),
          mybuttons(
            myfunction: () async {
              await ImagePicker(bytesFromPicker!, "HamzaAli");
              print("My UserName is ${logic.usercontroller.text}");
              print("My email is ${logic.emailcontroller.text}");
              print("My Password is ${logic.passcontroller.text}");

              logic.createUserOnFirebase();
              if (kDebugMode) {
                print("user loged in");
              }
            },
            mybtnwidget: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.ads_click), Gap(6), Text("SignUP")],
            ),
          ),
          Gap(16),
          TextButton(
              onPressed: () {
                logic.issignin.value = !logic.issignin.value;
              },
              child: Text(
                "Alrady Signd UP? Signed IN",
                style: mytextstyles.textStyle2M,
              )),
        ],
      ),
    );
  }

  Future<void> ImagePicker(Uint8List image, String folderpath) async {
    String filename = "HamzaAli.jpg";
    try {
      final Reference ref = await FirebaseStorage.instance
          .ref()
          .child(folderpath)
          .child(filename);
      ref.putData(image);
      final String mydownloads = await ref.getDownloadURL();
      print(mydownloads);
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }
}
