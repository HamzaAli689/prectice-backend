import 'dart:ui';

import 'package:flutter/material.dart';

class mytextstyles{
  
  static var textStyle1L = TextStyle(color: Colors.blue, fontSize: sizes.fontsizelarge,fontWeight: FontWeight.bold) ;
  static var textStyle2M = TextStyle(color: Colors.blue, fontSize: sizes.fontsizemedium) ;
  static var textStyle3S = TextStyle(color: Colors.blue, fontSize: sizes.fontsizesmall) ;
}

class sizes{
  static var fontsizelarge = 24.0;
  static var fontsizemedium = 14.0;
  static var fontsizesmall = 10.0;
}