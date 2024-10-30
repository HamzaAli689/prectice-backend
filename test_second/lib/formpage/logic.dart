import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_second/user.dart';

class FormLogic extends GetxController {
  TextEditingController namecontroller = TextEditingController();
 String malik = "sab" ;
  Future<void>pushDataOnFirebase(String imageUrl) async {
    var name = namecontroller.text;
    if (name.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    try {
      // Ensure Person is instantiated with proper data.
      Person person = Person(name: name, imageURL: imageUrl); // Assuming 'name' is a required field.

      // Add name to Firestore collection "user".
      await FirebaseFirestore.instance.collection("user").doc(name).set(person.toJson());
      Get.snackbar("Success", "Data saved successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to save data: $e");
      return;
    }
  }
}
