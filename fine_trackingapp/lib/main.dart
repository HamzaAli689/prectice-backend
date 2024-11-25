import 'package:fine_trackingapp/Screens/admin_panel/view.dart';
import 'package:fine_trackingapp/Screens/login__page/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/sign_up_page/view.dart';
import 'Screens/user_dashboard/view.dart';
import 'abdullah/screens/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fine Manager',
      theme: ThemeData.dark(),

      // initialRoute: '/Login_page',
      // getPages: [
      //   GetPage(
      //     name: '/SignUp_page',
      //     page: () =>  SignUp_page(),
      //   ),
      //   GetPage(
      //     name: '/Login_page',
      //     page: () =>  Login_Page(),
      //   ),
      //   GetPage(
      //     name: '/AdminPanelPage',
      //     page: () =>  AdminPanelPage(),
      //   ),
      //   GetPage(
      //     name: '/UserDashboardPage',
      //     page: () => UserDashboardPage(),
      //   ),
      // ],
      home: StudentApp(),
    );
  }
}
