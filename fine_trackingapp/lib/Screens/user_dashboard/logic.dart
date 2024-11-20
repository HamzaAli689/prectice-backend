import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fine_trackingapp/classes/users.dart';
import 'package:get/get.dart';

class UserDashboardLogic extends GetxController {
  // RxList to make it observable
  RxList<Users> userList = <Users>[].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<void> fetchData() async {
    try {
      QuerySnapshot allDocs = await firestore.collection("Users").get();
      userList.clear(); // Clear any existing data to avoid duplication
      for (var element in allDocs.docs) {
        Users newUser = Users.fromJson(element.data() as Map<String, dynamic>);
        userList.add(newUser);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Fetch data when the controller is initialized
  }
}
