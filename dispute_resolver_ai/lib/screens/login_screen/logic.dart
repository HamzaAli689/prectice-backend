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

  // Sign In with Firebase Function
  Future<void> createUserOnFirebase() async {
    if (emailcontroller.text.isEmpty || passcontroller.text.isEmpty) {
      Get.snackbar("Email and Password is Empty", "Please fill the all fields");
    } else {
      try {
        var User = await _firebaseAuth.createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passcontroller.text);
        if (User != null) {
          Get.to(() => HomePage(), transition: Transition.leftToRight);
        }
      } on Exception catch (e) {
        print("e");
        Get.snackbar("Some issue Occure", e.toString());
        // TODO
      }
    }
  }


  //Login with Firebase Function
  Future<void> loginUser() async {
    try {
      UserCredential myUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailcontroller.text, password: passcontroller.text);
      if (myUser != null) {
        Get.to(() => HomePage(),transition: Transition.leftToRight);
      } else {
        Get.snackbar("Some Error Occured", "User can't Login");
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar("Some Error Occured", e.toString());
      // TODO
    }
  }

  // Future<void> createUserOnFirebase() async {
  //    if(emailcontroller.text.isEmpty || passcontroller.text.isEmpty){
  //      Get.snackbar("Email and Password is Empty", "Both are Requried");
  //    }
  //    else{
  //      try {
  //        var User = await _firebaseAuth.createUserWithEmailAndPassword(
  //            email: emailcontroller.text, password: passcontroller.text);
  //        if(User != null){
  //          Get.to(() => HomePage(),transition: Transition.leftToRight);
  //        }
  //      } on Exception catch (e) {
  //        print(e);
  //        Get.snackbar("Some issue Occure", e.toString());
  //        // TODO
  //      }
  //    }
  //  }

  // Log Out from Firebase Function
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    Get.offAll(LoginScreenPage());
  }
}
