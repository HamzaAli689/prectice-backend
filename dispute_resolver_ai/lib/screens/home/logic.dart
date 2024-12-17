import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispute_resolver_ai/models/users.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  List<MyUsers> myusers = [];

  // Fetch all user from firebase
 Future<List<MyUsers>> GetUserFromFirebase() async {
   myusers.clear();
    QuerySnapshot myCollection =
        await FirebaseFirestore.instance.collection("Users").get();
    for (var element in myCollection.docs) {
      MyUsers mydata = MyUsers.fromJson(element.data() as Map<String, dynamic>);
      myusers.add(mydata);

    }
    return myusers;
  }

  // @override
  // void onInit() async{
  //   // TODO: implement onInit
  //   super.onInit();
  //   myusers.forEach((e){
  //     print(e.name);
  //   });
  // }


}
