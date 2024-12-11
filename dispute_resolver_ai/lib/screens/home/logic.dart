import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispute_resolver_ai/models/users.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  List<MyUsers> myusers = [];

  // Fetch all users from Firebase
  Future<List<MyUsers>> GetUserFromFirebase() async {
    // Clear the list to avoid duplicate data
    myusers.clear();

    // Fetch data from Firestore
    QuerySnapshot myCollection =
    await FirebaseFirestore.instance.collection("Users").get();

    // Map Firestore data to the MyUsers model
    for (var element in myCollection.docs) {
      MyUsers mydata = MyUsers.fromJson(element.data() as Map<String, dynamic>);
      myusers.add(mydata);
    }
    return myusers;
  }

  @override
  void onInit() {
    super.onInit();
    GetUserFromFirebase();
  }
}
