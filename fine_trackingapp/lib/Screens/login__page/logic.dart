import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home__page/view.dart';
import '../user_dashboard/view.dart';

class Login_PageLogic extends GetxController {

  final emailCL = TextEditingController();
  final passwordCL = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> loginonfirebase() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailCL.text,
        password: passwordCL.text,
      );
      Get.to(UserDashboardPage());  // Navigate to Dashboard after successful login
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

}
