import 'package:Estimatewale/view/app/homepage.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity/connectivity.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late WebViewController controller;

  bool isLoading = true;
  bool pagesLoading = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
        initialUrl: 'https://estimatewale.com/videopage',
        javascriptMode: JavascriptMode.unrestricted,
        allowsInlineMediaPlayback: true,
        gestureNavigationEnabled: true,
        onPageFinished: (finish) {
          setState(() {
            isLoading = false;
            pagesLoading = false;
          });
        },
        onPageStarted: (start) {
          setState(() {
            pagesLoading = true;
          });
        },
      ),
    );
  }
}
