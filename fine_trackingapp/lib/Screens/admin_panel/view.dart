import 'package:fine_trackingapp/widgets/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_dashboard/logic.dart';
import 'logic.dart';

class AdminPanelPage extends StatelessWidget {
  AdminPanelPage({Key? key}) : super(key: key);

  final AdminPanelLogic logic = Get.put(AdminPanelLogic());
  final UserDashboardLogic logic1 = Get.put(UserDashboardLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          TextField(
            controller: logic.fineC,
            decoration: const InputDecoration(
              labelText: "Fine per Mint",
              hintText: "Enter Fine",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20,),
          TextField(
            controller: logic.lateC,
            decoration: const InputDecoration(
              labelText: "Enter Late Limit",
              hintText: "Enter Late Limit",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20,),
          MyButtons(onpress: (){
            logic.updateFineAndLateLimit();
          }, title: "Update")
        ],
      ),
    );
  }
}
