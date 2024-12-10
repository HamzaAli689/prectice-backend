import 'package:dispute_resolver_ai/screens/login_screen/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/alertDailog.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),
      actions: [
        IconButton(onPressed: ()async{
         var result = await showDialog(context: context, builder: (context){
            return MyAlertBox(title: 'Signing Out'.tr, content: 'Are you sure to LogOut?',);
          });
         if(result == true){
           var myco = Get.find<Login_screenLogic>();
           await myco.logOut();
           myco.issignin.value = true;
           Get.snackbar("Success", "Sign Out Successfully");
           print("Sign Out Successfully");
         }
        }, icon: Icon(Icons.logout))
      ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("This is my Home Screen"),
            TextButton(onPressed: () async{
              await logic.GetUserFromFirebase();
            }, child: Text("Get User"))
          ],
        ),
      ),
    );
  }
}
