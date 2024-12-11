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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await showDialog(
                    context: context,
                    builder: (context) {
                      return MyAlertBox(
                        title: 'Signing Out'.tr,
                        content: 'Are you sure to LogOut?',
                      );
                    });
                if (result == true) {
                  var myco = Get.find<Login_screenLogic>();
                  await myco.logOut();
                  myco.issignin.value = true;
                  Get.snackbar("Success", "Sign Out Successfully");
                  print("Sign Out Successfully");
                }
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("This is my Home Screen"),
            Container(
              height: size.height * 0.75,
              width: size.width,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: showUser(context),
            ),
          ],
        ),
      ),
    );
  }

  showUser(context) {
    return Container(
      height: 800,
      width: 600,
      child: ListView.builder(
          itemCount: logic.myusers.length,
          itemBuilder: (context, i) {
            return ListTile();
          }),
    );
  }
}
