import 'package:flutter/material.dart';

class mybuttons extends StatelessWidget {
  VoidCallback myfunction;
  Widget mybtnwidget;
  mybuttons({super.key,required this.myfunction,required this.mybtnwidget});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width * .75,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Button background color
          foregroundColor: Colors.white, // Text color
          elevation: 5, // Elevation
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
        ),
        onPressed: myfunction,
        child: mybtnwidget,
      ),
    );
  }
}
