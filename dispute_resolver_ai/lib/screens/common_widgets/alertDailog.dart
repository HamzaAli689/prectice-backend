import 'package:dispute_resolver_ai/utilites/constants.dart';
import 'package:flutter/material.dart';


class MyAlertBox extends StatelessWidget {
  String title;
  String content;
  MyAlertBox({super.key,required this.title,required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 350,
      child: AlertDialog(
        title: Text(title,style: mytextstyles.textStyle2M,),
        content: Text(content,style: mytextstyles.textStyle3S,),
        actions: [
          TextButton(onPressed: (){
            // Get.back(result: true);
            Navigator.of(context).pop(true);
          }, child: Text("Yes",style: mytextstyles.textStyle2M,)),
          TextButton(onPressed: (){
            // Get.back(result: false);
            Navigator.of(context).pop(false);
          }, child: Text("No",style: mytextstyles.textStyle2M,)),
        ],
      ),
    );
  }
}
