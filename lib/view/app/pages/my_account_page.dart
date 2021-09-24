import 'package:fix_team_app/view/app/forms/accepted_queries.dart';
import 'package:fix_team_app/view/app/forms/declined_queries.dart';
import 'package:fix_team_app/view/app/forms/estimate_price.dart';
import 'package:fix_team_app/view/app/forms/generated_queris.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountPage extends StatelessWidget {
  final String username, address, phone, email, zipcode, rollId;
  const MyAccountPage({
    Key? key,
    required this.username,
    required this.address,
    required this.phone,
    required this.email,
    required this.zipcode,
    required this.rollId,
  }) : super(key: key);

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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: width,
                        height: height / 4,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: mainColor1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: mainColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  color: white,
                                ),
                              ),
                            ),
                            Text(
                              username.isNotEmpty ? username : "Username",
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 3,
                                    color: black.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  email.isNotEmpty ? email : "Email Id",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade200,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 3,
                                        color: black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  phone.isNotEmpty ? phone : "Phone No.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade200,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 3,
                                        color: black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  address.isNotEmpty ? address : "Address",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade200,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 3,
                                        color: black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
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
                        child: rollId == "3"
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GeneratedQueriesList(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 15),
                                      child: Text(
                                        "Estimate Price List",
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
                                          builder: (context) =>
                                              AcceptedQueriesList(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 15),
                                      child: Text(
                                        "Accepted Queries",
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
                                          builder: (context) =>
                                              DeclinedQueriesList(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 15),
                                      child: Text(
                                        "User Queries",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: dimGrey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GeneratedQueriesList(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 15),
                                      child: Text(
                                        "List Queries",
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
                                          builder: (context) =>
                                              AcceptedQueriesList(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 15),
                                      child: Text(
                                        "Accepted Queries",
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
                                          builder: (context) =>
                                              DeclinedQueriesList(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 15, bottom: 15, left: 15),
                                      child: Text(
                                        "Rejected Queris",
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
                                          builder: (context) =>
                                              EstimatePricePage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 15,
                                      ),
                                      child: Text(
                                        "Add Query",
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
