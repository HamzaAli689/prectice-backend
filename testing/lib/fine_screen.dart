import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing/services/firebase_services.dart';

import 'model/classess.dart';
// ... imports

class FineScreen extends StatefulWidget {
  const FineScreen({Key? key}) : super(key: key);

  @override
  State<FineScreen> createState() => _FineScreenState();
}

class _FineScreenState extends State<FineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firebaseService = FirebaseService();
  final _minutesLateController = TextEditingController();
  final _reasonController = TextEditingController();
  Users? user; // Make user nullable

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final loadedUser = await _firebaseService.getUserData();
      setState(() {
        user = loadedUser; // Update user after data is loaded
      });
    } catch (e) {
      print("Error loading user data: $e");
      // Show an error message to the user, perhaps using a SnackBar
    }
  }

  Future<void> _submitFine() async {
    if (_formKey.currentState!.validate() && user != null) { //Check if user is loaded
      try {
        await _firebaseService.recordFine(int.parse(_minutesLateController.text), _reasonController.text);
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fine recorded successfully')));
        _minutesLateController.clear();
        _reasonController.clear();
        _loadUserData(); //Reload user data
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error recording fine: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Record Fine')),
      body: user == null
          ? const Center(child: CircularProgressIndicator()) //Show loading indicator
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ... your form fields
              ElevatedButton(onPressed: _submitFine, child: const Text('Record Fine')),
              Text("Late Count: ${user!.lateCount}"), //Safe access to user.lateCount
              //Display fine history here using a ListView.builder if needed
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _minutesLateController.dispose();
    _reasonController.dispose();
    super.dispose();
  }
}
