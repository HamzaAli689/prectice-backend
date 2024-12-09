import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispute_resolver_ai/models/users.dart';
import 'package:dispute_resolver_ai/screens/home/view.dart';
import 'package:dispute_resolver_ai/screens/login_screen/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Login_screenLogic extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();

  RxBool issignin = true.obs;

  // Sign Up with Firebase Function
  Future<void> createUserOnFirebase(String myProfileImageUrl) async {
    if (emailcontroller.text.isEmpty || passcontroller.text.isEmpty) {
      Get.snackbar("Error", "Email and Password cannot be empty.");
      return;
    }

    try {
      UserCredential myUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passcontroller.text.trim(),
      );

      if (myUser.user != null) {
        String myUserId = myUser.user!.uid;

        MyUsers myUserData = MyUsers(
          id: myUserId,
          name: usercontroller.text.trim(),
          imageUrl: myProfileImageUrl,
          createdAt: DateTime.now(),
        );

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(myUserId)
            .set(myUserData.toJson());

        Get.to(() => HomePage(), transition: Transition.leftToRight);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "An error occurred during signup.");
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred: $e");
    }
  }

  // Login with Firebase Function
  Future<void> loginUser() async {
    if (emailcontroller.text.isEmpty || passcontroller.text.isEmpty) {
      Get.snackbar("Error", "Email and Password cannot be empty.");
      return;
    }

    try {
      UserCredential myUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passcontroller.text.trim(),
      );

      if (myUser.user != null) {
        Get.to(() => HomePage(), transition: Transition.leftToRight);
      } else {
        Get.snackbar("Error", "Failed to log in. Please try again.");
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "An error occurred during login.");
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred: $e");
    }
  }

  // Log Out Function
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      Get.offAll(() => LoginScreenPage());
    } catch (e) {
      Get.snackbar("Error", "Failed to log out. Please try again.");
    }
  }
}
