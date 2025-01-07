import 'package:dispute_resolver_ai/screens/home/view.dart';
import 'package:dispute_resolver_ai/screens/login_screen/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

checkSignedIn(BuildContext context){
  if(FirebaseAuth.instance.currentUser != null){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }
  else{
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreenPage()));
  }
}