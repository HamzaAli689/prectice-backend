import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_trackingapp/Screens/user_dashboard/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../classes/users.dart';
import '../home__page/view.dart';

class SignUp_pageLogic extends GetxController {
  final nameCS = TextEditingController();
  final emailCS = TextEditingController();
  final passwordCS = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> CreateUseronFirebase(String imageUrl) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailCS.text,
        password: passwordCS.text,
      );
      Users myUser = Users(
          name: nameCS.text,
          email: emailCS.text,
          password: passwordCS.text,
          imageUrl: imageUrl);
      await firestore.collection('users').doc(userCredential.user!.uid).set(
        myUser.toJson()
      );
      Get.to(UserDashboardPage()); // Navigate to Dashboard after successful signup
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<String?> imagePicker(Uint8List image, String folderPath) async {
    String fileName = "Hamza.jpg";
    try {
      final Reference ref =
      await FirebaseStorage.instance.ref().child(folderPath).child(fileName);
      ref.putData(image);
      final String myDownload = await ref.getDownloadURL();
      print(myDownload);
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }

}

