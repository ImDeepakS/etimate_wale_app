import 'package:Estimatewale/view/app/homepage.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late WebViewController controller;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "EstimateWale",
          style: GoogleFonts.poppins(
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://estimatewale.com/videos",
        onWebViewCreated: (controller) {
          this.controller = controller;
          controller.evaluateJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByClassName('bottom_text')[0].style.display='none'");
        },
        onPageFinished: (val) {
          controller.evaluateJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByClassName('bottom_text')[0].style.display='none'");
        },
        onPageStarted: (val) {
          controller.evaluateJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByClassName('bottom_text')[0].style.display='none'");
        },
        onProgress: (val) {
          setState(() {
            loading = true;
          });
          controller.evaluateJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByClassName('bottom_text')[0].style.display='none'");
        },
        onWebResourceError: (val) {
          controller.evaluateJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByClassName('bottom_text')[0].style.display='none'");
        },
      ),
    );
  }
}
