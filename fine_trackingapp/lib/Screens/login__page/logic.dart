import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_dashboard/view.dart';

class Login_PageLogic extends GetxController {

  final emailCL = TextEditingController();
  final passwordCL = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginonfirebase() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailCL.text,
        password: passwordCL.text,
      );
      Get.to(User_dashboardPage());  // Navigate to Dashboard after successful login
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

}
