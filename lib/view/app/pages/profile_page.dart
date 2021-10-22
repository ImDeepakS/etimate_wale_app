import 'package:Estimatewale/controller/login/auth_ser.dart';
import 'package:Estimatewale/controller/login/login_controller.dart';
import 'package:Estimatewale/controller/login/profile_contr.dart';
import 'package:Estimatewale/model/profile_model.dart';
import 'package:Estimatewale/view/app/homepage.dart';
import 'package:Estimatewale/view/app/pages/about_page.dart';
import 'package:Estimatewale/view/app/pages/contact_page.dart';
import 'package:Estimatewale/view/app/pages/privacy_policy_page.dart';
import 'package:Estimatewale/view/app/pages/term_page.dart';
import 'package:Estimatewale/view/app/pages/testimonial_page.dart';
import 'package:Estimatewale/view/app/users/dealer_register_page.dart';
import 'package:Estimatewale/view/app/users/login_type.dart';
import 'package:Estimatewale/view/app/users/user_register_page.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";

  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                decoration: BoxDecoration(color: white),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width,
                          height: height / 5,
                          decoration: BoxDecoration(
                            color: mainColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 50, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hello!",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: white,
                                      ),
                                    ),
                                    Text(
                                      username.toUpperCase(),
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30,
                                        letterSpacing: 1,
                                        color: white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              username != null
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                        top: 20,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          storage.delete(key: "token");
                                          signOutFromGoogle();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginTypePage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: black.withOpacity(0.3),
                                                blurRadius: 10,
                                                offset: Offset(0.5, 0.5),
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            "Log Out",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(left: 100),
                                      child: PopupMenuButton(
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserRegisterPage(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Sign Up as Customer",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  color: dimGrey,
                                                ),
                                              ),
                                            ),
                                            value: 1,
                                          ),
                                          PopupMenuItem(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DealerRegisterPage(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Sign Up as Retailer",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  color: dimGrey,
                                                ),
                                              ),
                                            ),
                                            value: 2,
                                          ),
                                        ],
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: black.withOpacity(0.3),
                                                blurRadius: 10,
                                                offset: Offset(0.5, 0.5),
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            "Sign Up!",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 130,
                            left: 15,
                            right: 20,
                          ),
                          child: Container(
                            width: width / 1.1,
                            height: 60,
                            padding: EdgeInsets.only(right: 20, top: 18),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: black.withOpacity(0.2),
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Providing Services To Nation",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: dimGrey,
                                  ),
                                ),
                                Text(
                                  "Give us a chance to serve you better.",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: mainColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    Container(
                      width: width / 1.2,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: black.withOpacity(0.3),
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => MyAccountPage(
                                //       username: profileDetails.user_name,
                                //       zipcode: profileDetails.zip_code,
                                //       address: profileDetails.address_txt,
                                //       email: profileDetails.e_mail,
                                //       phone: profileDetails.phone_no,
                                //     ),
                                //   ),
                                // );
                                userProfile(context, username);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15),
                                child: Text(
                                  "My Account",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: dimGrey,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: black,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContactUsPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15),
                                child: Text(
                                  "Contact Us!",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: dimGrey,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: black,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutUsPage(
                                      userid: profileDetails.user_id,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15),
                                child: Text(
                                  "About Us!",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: dimGrey,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: black,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TermsConditionPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15),
                                child: Text(
                                  "Terms & Conditions!",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: dimGrey,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: black,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrivacyPolicyPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15),
                                child: Text(
                                  "Privacy policy",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: dimGrey,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: black,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TestimonialPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 15),
                                child: Text(
                                  "Our Testomonials!",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: dimGrey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: width / 1.2,
                      child: Text(
                        "Copyright @ 2021 Estimatewale All rights reserved v1.1",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: dimGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Go Back",
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

  ProfileDetails profileDetails = ProfileDetails();

  checkLogin() async {
    String? tokne = await getToken();
    print("tokne");
    print(tokne);
    if (tokne != null) {
      setState(() {
        username = tokne;
      });
    } else {
      username = "Please Login or SignUp";
    }
  }
}
