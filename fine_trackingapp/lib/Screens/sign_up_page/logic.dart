import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_trackingapp/Screens/user_dashboard/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../classes/users.dart';

class SignUpPageLogic extends GetxController {
  // Controllers for text fields
  final nameCS = TextEditingController();
  final emailCS = TextEditingController();
  final passwordCS = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Create a user in Firebase Authentication and Firestore
  Future<void> createUserOnFirebase(String imageUrl) async {
    try {
      if(emailCS.text.isEmpty || passwordCS.text.isEmpty){
        Get.snackbar("Error", "Please fill the all fields");
        return ;

    }
      // Sign up user with Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailCS.text.trim(),
        password: passwordCS.text.trim(),
      );

      // Create user data
      Users myUser = Users(
        name: nameCS.text.trim(),
        email: emailCS.text.trim(),
        password: passwordCS.text.trim(),
        imageUrl: imageUrl,

      );

      // Save user data in Firestore
      await firestore.collection('users').doc(nameCS.text).set(myUser.toJson());

      // Navigate to the user dashboard after successful signup
      Get.to(() => UserDashboardPage());
    } catch (e) {
      // Show error message on failure
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// Upload an image to Firebase Storage and return the download URL
  Future<String?> imagePicker(Uint8List image, String folderPath) async {
    try {
      // Generate a unique file name for the image
      String fileName = "Hamza.jpg";
      final Reference ref = FirebaseStorage.instance.ref().child(folderPath).child(fileName);

      // Upload the image to Firebase Storage
      await ref.putData(image);

      // Get and return the image's download URL
      return await ref.getDownloadURL();
    } catch (e) {
      // Log and show an error message on upload failure
      print("Image upload error: $e");
      Get.snackbar(
        'Error',
        'Failed to upload image',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }
}
