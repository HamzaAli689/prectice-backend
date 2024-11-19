import 'package:fine_trackingapp/Screens/login__page/view.dart';
import 'package:fine_trackingapp/widgets/my_buttons.dart';
import 'package:fine_trackingapp/widgets/mytext_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SignUp_page extends StatelessWidget {
  SignUp_page({Key? key}) : super(key: key);

  final SignUp_pageLogic logic = Get.put(SignUp_pageLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        MytextFields(lable: "User Name", mycontroller: logic.nameCS, obscureText: false),
                         SizedBox(height: 15),
                        MytextFields(lable: "Email", mycontroller: logic.emailCS, obscureText: false),
                        const SizedBox(height: 15),
                        MytextFields(lable: "Password", mycontroller: logic.passwordCS, obscureText: true),
                        const SizedBox(height: 20),
                        MyButtons(onpress: (){
                          logic.CreateUseronFirebase();
                        }, title: "Sign UP"),
                         SizedBox(height: 10),
                        TextButton(
                          onPressed: (){
                            Get.to(Login_Page());
                          },
                          child: const Text(
                            'Already hav an account? Sign In',
                            style: TextStyle(color: Colors.cyanAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
