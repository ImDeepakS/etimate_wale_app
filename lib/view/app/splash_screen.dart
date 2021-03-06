import 'dart:async';
import 'package:Estimatewale/controller/login/login_controller.dart';
import 'package:Estimatewale/controller/login/profile_contr.dart';
import 'package:Estimatewale/view/app/homepage.dart';
import 'package:Estimatewale/view/app/users/login_type.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/helpers/fade_route.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  Widget currentPage = HomePage();

  @override
  void initState() {
    super.initState();
    checkLogin();
    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Timer(Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    });
    Timer(Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(Duration(milliseconds: 3850), () {
      setState(() {
        Navigator.of(context).push(
          ThisIsFadeRoute(
            route: currentPage,
            page: currentPage,
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? _h / 2
                      : 20,
            ),
            AnimatedContainer(
              duration: Duration(
                seconds: _d
                    ? 1
                    : _c
                        ? 2
                        : 0,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? _h
                  : _c
                      ? 80
                      : 20,
              width: _d
                  ? _w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                color: _b ? Colors.white : Colors.transparent,
                borderRadius:
                    _d ? BorderRadius.only() : BorderRadius.circular(30),
              ),
              child: _e
                  ? Center(
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            "EstimateWale",
                            duration: Duration(milliseconds: 1700),
                            textStyle: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: dimGrey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  checkLogin() async {
    String? tokne = await getToken();
    print("tokne");
    print(tokne);
    if (tokne != null) {
      setState(() {
        currentPage = HomePage();
        userProfile(context, tokne);
      });
    } else {
      // currentPage = LoginPage();
      currentPage = LoginTypePage();
    }
  }
}
