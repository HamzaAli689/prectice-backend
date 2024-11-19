import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_trackingapp/Screens/user_dashboard/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home__page/view.dart';

class SignUp_pageLogic extends GetxController {

  final nameCS = TextEditingController();
  final emailCS = TextEditingController();
  final passwordCS = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> CreateUseronFirebase() async {
    // setState(() {
    //   isLoading = true;  // Show loading spinner
    // });
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailCS.text,
        password: passwordCS.text,
      );
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': nameCS.text,
        'email': emailCS.text,
        'uid': userCredential.user!.uid,
      });
      Get.to(Home_Page());  // Navigate to Dashboard after successful signup
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

}
