import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_trackingapp/classes/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDashboardLogic extends GetxController {
  List userList = <Users> [].obs ;

  Future<List> getUsersFromFirebase() async{
    QuerySnapshot myAllDocuments = await FirebaseFirestore.instance.collection("Users").get();
    for(var element in myAllDocuments.docs){
      Users myUser = Users.fromJson(element.data() as Map<String,dynamic>);
      userList.add(myUser);
    }
    return userList;

    }

  @override
  void onInit() {
    super.onInit();
    getUsersFromFirebase();
  }
}
