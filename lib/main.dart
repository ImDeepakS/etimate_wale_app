import 'package:fix_team_app/view/app/splash_screen.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: white,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
