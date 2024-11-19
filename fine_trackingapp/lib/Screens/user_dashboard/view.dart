import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class User_dashboardPage extends StatelessWidget {
  User_dashboardPage({Key? key}) : super(key: key);

  final User_dashboardLogic logic = Get.put(User_dashboardLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
