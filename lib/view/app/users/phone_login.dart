import 'package:fix_team_app/controller/login/auth_service.dart';
import 'package:fix_team_app/controller/phone%20auth/phone_auth_controller.dart';
import 'package:fix_team_app/view/app/loginpage.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({Key? key}) : super(key: key);

  @override
  _PhoneLoginPageState createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String phoneNumber = "";

  int counter = 0;
  int counterVal = 0;

  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Sign-in.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 30,
                    ),
                    child: Text(
                      "Login as ",
                      style: GoogleFonts.poppins(
                        color: dimGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          LabelText(label: "Please Enter Mobile Number"),
                          SizedBox(height: 10),
                          // Container(
                          //   padding: EdgeInsets.only(
                          //     top: 5,
                          //     bottom: 5,
                          //     left: 10,
                          //     right: 10,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     color: white,
                          //     borderRadius: BorderRadius.circular(10),
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color: black.withOpacity(0.3),
                          //         blurRadius: 5,
                          //         offset: Offset(0.5, 0.5),
                          //       ),
                          //     ],
                          //   ),
                          //   child: TextFormField(
                          //     controller: phoneController,
                          //     keyboardType: TextInputType.number,
                          //     style: GoogleFonts.poppins(
                          //       color: shadyGrey,
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //     decoration: new InputDecoration(
                          //       hintText: "Enter Mobile No.",
                          //       isDense: true,
                          //       fillColor: Colors.white,
                          //       border: InputBorder.none,
                          //       hintStyle: GoogleFonts.poppins(
                          //         color: shadyGrey,
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //     inputFormatters: [
                          //       LengthLimitingTextInputFormatter(10),
                          //     ],
                          //     validator: (String? value) {
                          //       if (value != null && value.isEmpty) {
                          //         return "message";
                          //       }
                          //       return null;
                          //     },
                          //     onChanged: (value) {
                          //       if (value.length > 10) {
                          //         if (value.length < 10) {
                          //           ScaffoldMessenger.of(context).showSnackBar(
                          //             SnackBar(
                          //               content: Text(
                          //                   "Please Enter Correct Phone Number"),
                          //             ),
                          //           );
                          //         }
                          //       }
                          //       setState(() {
                          //         counter = value.length;
                          //       });
                          //     },
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     left: 40,
                          //     top: 5,
                          //   ),
                          //   child: RichText(
                          //     text: TextSpan(children: [
                          //       TextSpan(
                          //         text: counter.toString(),
                          //         style: TextStyle(
                          //           color: counter < 10 ? Colors.red : green,
                          //         ),
                          //       ),
                          //       TextSpan(
                          //         text: "/10",
                          //         style: TextStyle(color: black),
                          //       ),
                          //     ]),
                          //   ),
                          // ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "+91",
                                    style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: mainColor1,
                                  thickness: 2,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                Container(
                                  width: width / 2,
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: phoneController,
                                    cursorColor: mainColor,
                                    cursorHeight: 20,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your number',
                                      hintStyle: GoogleFonts.poppins(
                                        color: shadyGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    onChanged: (value) {
                                      if (value.length > 10) {
                                        if (value.length < 10) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Please Enter Correct Phone Number"),
                                            ),
                                          );
                                        }
                                      }
                                      setState(() {
                                        counter = value.length;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    top: 5,
                                  ),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: counter.toString(),
                                        style: TextStyle(
                                          color:
                                              counter < 10 ? Colors.red : green,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "/10",
                                        style: TextStyle(color: black),
                                      ),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Want to login using username?",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: shadyGrey,
                                ),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Click here!",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: mainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    FocusManager.instance.primaryFocus!.unfocus();
                    if (phoneController.text == "") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Please fill mobile number"),
                            actions: <Widget>[
                              TextButton(
                                child: new Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      String countryCode = '+91';
                      phoneNumber = '$countryCode${phoneController.text}';
                      authClass.verifyPhoneNumber(
                          phoneNumber, phoneController.text, context, setData);
                      showAlertDialog(context);
                    }
                    if (counter < 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please Enter Valid Phone Number"),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(green),
          ),
          SizedBox(width: 8),
          Text("Please Wait"),
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
  }
}
