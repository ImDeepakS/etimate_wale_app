import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_team_app/controller/login/login_controller.dart';
import 'package:fix_team_app/controller/phone%20auth/phone_auth_controller.dart';
import 'package:fix_team_app/controller/user/register_user_via_phone_controller.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  final String phone, verId;
  const OTPScreen({Key? key, required this.phone, required this.verId})
      : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int counter = 0;

  @override
  void initState() {
    super.initState();
    print("ver id is ${widget.phone}");
  }

  String error = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";

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
                          Text(
                            widget.phone,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Please Enter OTP"),
                          SizedBox(height: 10),
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
                                SizedBox(width: 10),
                                Container(
                                  width: width / 1.5,
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: otpController,
                                    cursorColor: mainColor,
                                    cursorHeight: 20,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Enter OTP that you received',
                                      hintStyle: GoogleFonts.poppins(
                                        color: shadyGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(6),
                                    ],
                                    onChanged: (value) {
                                      if (value.length > 6) {
                                        if (value.length < 6) {
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
                                              counter < 6 ? Colors.red : green,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "/6",
                                        style: TextStyle(color: black),
                                      ),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
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
                    authClass.signInwithPhoneNumber(
                        widget.verId, otpController.text, context);
                    print("verification id ${widget.verId}");
                    registerViaPhone(
                      context,
                      widget.phone,
                      "",
                      widget.phone,
                      "",
                      "",
                      "",
                      "",
                      "",
                    );
                    storeTokenAndData(widget.phone, widget.verId);
                  },
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Login",
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
}
