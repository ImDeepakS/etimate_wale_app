import 'package:fix_team_app/view/app/forms/estimate_price.dart';
import 'package:fix_team_app/view/app/pages/about_page.dart';
import 'package:fix_team_app/view/app/pages/contact_page.dart';
import 'package:fix_team_app/view/app/users/dealer_register_page.dart';
import 'package:fix_team_app/view/app/users/user_register_page.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60, left: 20),
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
                                  "Please login/signup!",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
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
                                  borderRadius: BorderRadius.circular(10),
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
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            title: Text(
                              "Services",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: dimGrey,
                              ),
                            ),
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EstimatePricePage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 15,
                                    bottom: 15,
                                  ),
                                  child: Text(
                                    "Repair Your phone",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: shadyGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                            padding:
                                EdgeInsets.only(top: 15, bottom: 15, left: 15),
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
                                builder: (context) => AboutUsPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding:
                                EdgeInsets.only(top: 15, bottom: 15, left: 15),
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
                        Container(
                          padding:
                              EdgeInsets.only(top: 15, bottom: 15, left: 15),
                          child: Text(
                            "Terms & Conditions!",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: dimGrey,
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: black,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 15, bottom: 15, left: 15),
                          child: Text(
                            "Our Testomonials!",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: dimGrey,
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
                    "Copyright @ 2021 FixTeam All rights reserved v1.1",
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
    );
  }
}
