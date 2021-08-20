import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_team_app/view/app/forms/search_file.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      padding: EdgeInsets.only(top: 67),
                      width: width,
                      height: height / 1.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            white,
                            greenBody,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: CarouselSlider(
                        items: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/slider1.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/slider1.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/slider1.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          height: height,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.mapPin,
                                    size: 26,
                                    color: greenBody,
                                  ),
                                  SizedBox(width: 3),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Your City",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Ludhiana",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(width: 7),
                                          Icon(
                                            FontAwesomeIcons.chevronDown,
                                            size: 15,
                                            color: greenBody,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 130),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.favorite,
                                              color: shadyGrey,
                                              size: 24,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: greenBody,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 8),
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.shopping_cart,
                                              color: shadyGrey,
                                              size: 24,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: greenBody,
                                                ),
                                              ),
                                            ),
                                          ],
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
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SearchFile(),
                              ),
                            );
                          },
                          child: Container(
                            width: width / 1.2,
                            height: 35,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.5, 0.5),
                                  blurRadius: 5,
                                  color: black.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                hintText: "What you want to sell?",
                                hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: dimGrey,
                                ),
                                enabled: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Services",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: dimGrey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.5, 0.5),
                            blurRadius: 10,
                            color: black.withOpacity(0.1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Image(
                                image: AssetImage("assets/repair_phone.png"),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Repair",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: dimGrey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image(
                                image: AssetImage("assets/estimate_price.png"),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Estimate",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: dimGrey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image(
                                image: AssetImage("assets/find_dealer.png"),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Find",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: dimGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
