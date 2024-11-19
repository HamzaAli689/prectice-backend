import 'package:flutter/material.dart';

class MytextFields extends StatelessWidget {
  String lable;
  final bool obscureText;
  TextEditingController mycontroller = TextEditingController();
  MytextFields({super.key,required this.lable,required this.mycontroller, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(style: TextStyle(color: Colors.white),
      controller: mycontroller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: TextStyle(color: Colors.white70),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyanAccent),
        ),
      ),
    );
  }
}
