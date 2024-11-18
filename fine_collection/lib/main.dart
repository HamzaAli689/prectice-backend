import 'package:fine_collection/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fine Manager',
      home: Scaffold(
        appBar: AppBar(title: Text("HAmza"),),
      ),
      // theme: ThemeData.dark(),
      // home: const HomePage(),
    );
  }
}
