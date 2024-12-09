import 'package:flutter/material.dart';

class myText_fields extends StatelessWidget {
  String lable;
  TextEditingController mycontroller = TextEditingController();
   myText_fields({super.key, required this.mycontroller, required this.lable});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Card(
      elevation: 8.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
          width: size.width *.75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0)
          ),
          child: TextFormField(
            controller: mycontroller,
            decoration: InputDecoration(border: InputBorder.none,
            hintText: lable
            ),
          ),

      ),
    );
  }
}
