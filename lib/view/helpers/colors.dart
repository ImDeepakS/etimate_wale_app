import 'package:flutter/material.dart';

Color mainColor = Color(0xffF7BA07);
Color mainColor1 = Color(0xff005F7D);
Color black = Colors.black;
Color shadyGrey = Colors.grey.shade400;
Color dimGrey = Colors.grey.shade500;
Color white = Colors.white;
Color greenBody = Colors.tealAccent;
Color yellowBody = Color(0xffF7BA07);
Color purpleBody = Color(0xff7E5EFF);
Color blueBody = Colors.blue;

class SizeConfig {
  static double? height;
  static double? width;

  void init(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
