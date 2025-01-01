import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispute_resolver_ai/models/users.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  List<MyUsers> myusers = [];

  // Fetch all user from firebase
 Future<List<MyUsers>> GetUserFromFirebase() async {
   print('0');
   try {
     myusers.clear();
     QuerySnapshot myCollection =
             await FirebaseFirestore.instance.collection("Users").get();
     print('0');
     for (var element in myCollection.docs) {
           print('-------------');
           print(element.data());
           MyUsers mydata = MyUsers.fromJson(element.data() as Map<String, dynamic>);
           print('-------------');
           print(mydata.name);
           myusers.add(mydata);
         }
     print("My users lngth: ${myusers.length}");
   } catch (e) {
     print(e);
   }
    return myusers;
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    myusers.forEach((e){
      print(e.name);
    });
  }


}
