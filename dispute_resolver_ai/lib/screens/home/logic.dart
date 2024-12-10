import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispute_resolver_ai/models/users.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  List<MyUsers> myusers = [];

  // Fetch all user fro firebase
  GetUserFromFirebase() async {
    QuerySnapshot myCollection =
        await FirebaseFirestore.instance.collection("Users").get();
    for (var element in myCollection.docs) {
      print(element.data());
      MyUsers myuser = MyUsers.fromJson(element.data() as Map<String, dynamic>);
      print(myuser.name);
      myusers.add(myuser);
    }
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await GetUserFromFirebase();
    myusers.forEach((e){
      print(e.name);
    });
  }
}
