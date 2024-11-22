// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../model/users.dart';
// import 'logic.dart';
//
// class Home_screenPage extends StatelessWidget {
//   Home_screenPage({Key? key}) : super(key: key);
//
//   final Details_screenLogic logic = Get.put(Details_screenLogic());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: showUsers(context));
//   }
//
//   showUsers(context) {
//     return FutureBuilder(
//       future: logic.getUsersOnFirebase(),
//       builder: (context, AsyncSnapshot<List<Student>> snapshot) {
//         if (snapshot.hasData) {
//           print('My user list ${snapshot.data!.length}');
//         }
//         return Container(
//           child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: logic.myAllStudets.length,
//             itemBuilder: (context, i) {
//               // Convert createdAt (in microseconds) to DateTime
//
//
//               DateTime dateTime;
//               if (logic.myAllStudets[i].createdAt.runtimeType == int) {
//                 dateTime = DateTime.fromMicrosecondsSinceEpoch(logic.myAllStudets[i].createdAt);
//               } else {
//                 dateTime = DateTime.parse(logic.myAllStudets[i].createdAt.toString());
//               }
//
//
//
//
//
//               DateTime adjustedDateTime = dateTime.subtract(Duration(days: 20));
//               String displayDateAndTime =
//               DateFormat.yMd().add_jm().format(adjustedDateTime);
//
//               return Column(
//                 children: [
//                   Card(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     elevation: 20,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Container(
//                       padding: EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.shade300,
//                             blurRadius: 10,
//                             offset: Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: ListTile(
//                         title: Text(
//                           logic.myAllStudets[i].name,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.teal.shade900,
//                           ),
//                         ),
//                         leading:GestureDetector(
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return Dialog(
//                                   child: Container(
//                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
//                                     child: Image.network(
//                                       logic.myAllStudets[i].imageUrl,
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                           child: ClipOval(
//                             child: Image.network(
//                               logic.myAllStudets[i].imageUrl,
//                               height: 120,
//                               width: 120,
//                             ),
//                           ),
//                         ),
//                         subtitle: Text('$displayDateAndTime'),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showAddFineDialog() {
  Get.defaultDialog(
    title: "ADD FINE",
    content: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "Fine Amount",
            hintText: "Enter fine amount",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: "Reason",
            hintText: "Enter reason for fine",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    ),
    confirm: ElevatedButton(
      onPressed: () {
        // Add confirmation logic here
        Get.back(); // Close the dialog
      },
      child: Text("Confirm"),
    ),
    cancel: ElevatedButton(
      onPressed: () {
        Get.back(); // Close the dialog without action
      },
      child: Text("Cancel"),
    ),
  );
}
