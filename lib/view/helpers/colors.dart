import 'package:flutter/material.dart';

Color mainColor = Color(0xfff7e841);
Color black = Colors.black;
Color shadyGrey = Colors.grey.shade400;
Color dimGrey = Colors.grey.shade500;

class SizeConfig {
  static double? height;
  static double? width;

  void init(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
