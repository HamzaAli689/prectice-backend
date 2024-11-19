import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SignUp_page extends StatelessWidget {
  SignUp_page({Key? key}) : super(key: key);

  final SignUp_pageLogic logic = Get.put(SignUp_pageLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
