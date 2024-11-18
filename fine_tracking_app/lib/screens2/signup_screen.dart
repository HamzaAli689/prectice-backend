import 'package:fine_tracking_app/screens2/login/signup_screen.dart';
import 'package:fine_tracking_app/screens2/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<void> _login() async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );
  //     Get.to(UserDashboard());  // Navigate to Dashboard after successful login
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
  //   }
  // }

  Future<void> _signup() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.to(UserDashboard());  // Navigate to Dashboard after successful signup
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

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
                    boxShadow: [
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
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'User Name',
                            labelStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyanAccent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyanAccent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyanAccent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _signup,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.cyanAccent, Colors.blueAccent],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'SignUp',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: (){
                            Get.to(LoginScreen());
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


// class LoginSignupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Welcome Back!',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blueGrey[800],
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black45,
//                         blurRadius: 10,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Email',
//                             labelStyle: TextStyle(color: Colors.white70),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white54),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.cyanAccent),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         TextField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             labelStyle: TextStyle(color: Colors.white70),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white54),
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.cyanAccent),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         GestureDetector(
//                           onTap: () {
//                             // Add login logic
//                           },
//                           child: Container(
//                             width: double.infinity,
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [Colors.cyanAccent, Colors.blueAccent],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Text(
//                               'Login',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         TextButton(
//                           onPressed: () {
//                             // Navigate to signup screen
//                           },
//                           child: Text(
//                             'Don\'t have an account? Sign Up',
//                             style: TextStyle(color: Colors.cyanAccent),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
