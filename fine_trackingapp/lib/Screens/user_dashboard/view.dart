import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_trackingapp/Screens/admin_panel/view.dart';
import 'package:fine_trackingapp/classes/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../admin_panel/logic.dart';
import 'logic.dart';

class UserDashboardPage extends StatelessWidget {
  UserDashboardPage({Key? key}) : super(key: key);

  final UserDashboardLogic logic = Get.put(UserDashboardLogic());
  final AdminPanelLogic logic1 = Get.put(AdminPanelLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text(
          'User Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              logic.getUsersFromFirebase(); // Refresh data on button press
            },
          ),
          IconButton(
            icon: const Icon(Icons.admin_panel_settings, color: Colors.white),
            onPressed: () {
              Get.to(()=> AdminPanelPage()); // Refresh data on button press
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: logic.getUsersFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('My user list ${snapshot.data!.length}');
          }
          return Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: logic.userList.length,
              itemBuilder: (context, i) {
                // Convert createdAt (in microseconds) to DateTim

                return Column(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                logic.userList[i].name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade900,
                                ),
                              ),
                              Obx(() {
                                return Text(
                                  'Total Fines: \$${logic.totalFines.value}',
                                  style: const TextStyle(color: Colors.black),
                                );
                              })

                            ],
                          ),
                          trailing: ElevatedButton(
                              onPressed: () {
                                // In the dialog (after the admin enters values):
                                Get.defaultDialog(
                                  backgroundColor: Colors.blueGrey[900],
                                  title: "ADD FINE",
                                  content: Column(
                                    children: [
                                      TextField(
                                        controller: logic.timeC,
                                        decoration: const InputDecoration(
                                          labelText: "Late Limit",
                                          hintText: "Enter Late Time",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                  confirm: ElevatedButton(
                                    onPressed: () async {
                                      double finePerMinute = double.tryParse(logic.fineC.text) ?? 0.0;
                                      int lateMinutes = int.tryParse(logic.timeC.text) ?? 0;

                                      // Update the fine calculation in UserController and Firebase
                                      logic.fineRate.value = finePerMinute;
                                      logic.updateFines(lateMinutes);

                                      // Save the fine per minute to Firebase
                                      await FirebaseFirestore.instance.collection('rules').doc('fineSettings').set({
                                        'finePerMinute': finePerMinute,
                                      });

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

                              },
                              child: const Text("Add")),
                          leading: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Image.network(
                                        logic.userList[i].imageUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: ClipOval(
                              child: Image.network(
                                logic.userList[i].imageUrl,
                                height: 120,
                                width: 120,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

