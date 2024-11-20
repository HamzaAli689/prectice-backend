import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/my_buttons.dart';
import '../../widgets/mytext_fields.dart';
import '../sign_up_page/view.dart';
import 'logic.dart';

class Login_Page extends StatelessWidget {
  Login_Page({Key? key}) : super(key: key);

  final Login_PageLogic logic = Get.put(Login_PageLogic());

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
                        MytextFields(
                          lable: 'Email',
                          mycontroller: logic.emailCL,
                          obscureText: false,
                        ),
                        const SizedBox(height: 15),
                        MytextFields(
                          lable: 'Password',
                          mycontroller: logic.passwordCL,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        MyButtons(
                          onpress: () {
                            logic.loginonfirebase();
                            Get.snackbar("Login", "Login Succesfully");
                          },
                          title: 'Login',
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Get.to(SignUp_page());
                          },
                          child: const Text(
                            'Don\'t have an account? Sign Up',
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
