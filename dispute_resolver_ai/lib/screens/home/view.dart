import 'package:dispute_resolver_ai/models/users.dart';
import 'package:dispute_resolver_ai/screens/login_screen/logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../common_widgets/alertDailog.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await showDialog(
                    context: context,
                    builder: (context) {
                      return MyAlertBox(
                        title: 'Signing Out'.tr,
                        content: 'Are you sure to LogOut?',
                      );
                    });
                if (result == true) {
                  var myco = Get.find<Login_screenLogic>();
                  await myco.logOut();
                  myco.issignin.value = true;
                  Get.snackbar("Success", "Sign Out Successfully");
                  print("Sign Out Successfully");
                }
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("This is my Home Screen"),
            Container(
              height: size.height * 0.75,
              width: size.width,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: showUser(context),
            ),
          ],
        ),
      ),
    );
  }

  showUser(context) {
    return FutureBuilder(
        future: logic.GetUserFromFirebase(),
        builder: (context, AsyncSnapshot<List<MyUsers>> snapshot) {
          if (snapshot.hasData) {

            return Container(
              height: 800,
              width: 600,
              decoration: BoxDecoration(color: Colors.green),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    DateTime datetime = DateTime.parse(snapshot.data![i].createdAt.toString());
                    String Date = DateFormat("EEEE, dd MMMM yyyy").format(datetime);
                    String TIme = DateFormat("hh:mm:ss a").format(datetime);
                    return FirebaseAuth.instance.currentUser!.uid == snapshot.data![i].id ?Container() :
                        ListTile(
                          onTap: (){
                           logic.createChatRoom(logic.myusers[i].id);
                          },
                          leading: ClipOval(
                            child: Image.network(
                              snapshot.data![i].imageUrl ??
                                  "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg",
                              fit: BoxFit.cover,
                              width: 50,
                              height: 100,
                            ),
                          ),
                          title: Text(snapshot.data![i].name.toUpperCase()),
                          subtitle: Text("$Date $TIme"),
                        );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        });
  }
}
