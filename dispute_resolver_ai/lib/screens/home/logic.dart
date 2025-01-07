import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dispute_resolver_ai/models/users.dart';
import 'package:dispute_resolver_ai/screens/chat/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  List<MyUsers> myusers = [];
  var myfbins = FirebaseAuth.instance;
  var myfbfs = FirebaseFirestore.instance;

  // Fetch all user from firebase
 Future<List<MyUsers>> GetUserFromFirebase() async {
   // print('0');
   try {
     myusers.clear();
     QuerySnapshot myCollection =
             await FirebaseFirestore.instance.collection("Users").get();
     print('0');
     for (var element in myCollection.docs) {
           // print('-------------');
           // print(element.data());
           MyUsers mydata = MyUsers.fromJson(element.data() as Map<String, dynamic>);
           // print('-------------');
           // print(mydata.name);
           myusers.add(mydata);
         }
     // print("My users lngth: ${myusers.length}");
   } catch (e) {
     print(e);
   }
    return myusers;
  }


  createChatRoom(String otherUserId) async{
   print("other user id = $otherUserId");
   print(myfbins.currentUser!.uid);
   String chatRoomId = "${myfbins.currentUser!.uid}-$otherUserId";
   print("My Chat Room Id is: $chatRoomId");

   var mychatroomId = await myfbfs.collection("chats").doc(chatRoomId).get();
   if(mychatroomId.exists){
     //navigate to chatpage
     Get.to(() => ChatPage());
   }
   else{
     await myfbfs.collection("chats").doc(chatRoomId).set({
       "chatRoom ID" : chatRoomId,
       "TimeStamp" : DateTime.now(),
     });
     Get.to(() => ChatPage());
   }



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
