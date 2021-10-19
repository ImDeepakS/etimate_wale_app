import 'package:Estimatewale/view/app/forms/estimate_price.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  final String userid;
  const AboutUsPage({Key? key, required this.userid}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/repair.png"),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We're All About",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: dimGrey,
                      ),
                    ),
                    Text(
                      "Smartphone Repair",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "About Us",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: dimGrey,
                      ),
                    ),
                    Container(
                      height: 3,
                      width: width / 6,
                      color: mainColor,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: width / 1.2,
                      child: Text(
                        "Mobile phones are an intrinsic part of our life and imaging our life without the same is kind of difficult. You used to use your phone for everything to do your work or attend online meetings. What if your mobile phone breaks or got some other fault? Now! What??? The first thing that comes to your mind that how much will be the repair cost and where to find a reliable mobile service technician. Indeed! When you are doing it for the first time, it is difficult to trust someone as to whether they can justify the repair service or not. WAIT! You Don’t have to bother yourself.",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: dimGrey,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: width / 1.2,
                      child: Text(
                        "Estimatewale will help you come across the best mobile repair dealers in your city. You have to fill in the problem details and submit your query to get the estimated price for your mobile problem instantly also you will get the contact details of your nearby mobile repair shops. you can also compare the prices given by repair dealers. We tried to give our best to find the solution for your mobile-related problems",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: dimGrey,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            width: 120,
                            height: 130,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/price_icon.png"),
                                    ),
                                    color: white,
                                  ),
                                ),
                                Text(
                                  "Best price Estimate",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: shadyGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            width: 120,
                            height: 130,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  padding: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: white,
                                  ),
                                  child: Center(
                                    child: Image(
                                      image: AssetImage("assets/premium.png"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Premium Repair",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: shadyGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            width: 120,
                            height: 130,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: white,
                                  ),
                                  padding: EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Image(
                                      image:
                                          AssetImage("assets/repair_icon.png"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Instant Mobile Repair",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: shadyGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            width: 120,
                            height: 130,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: white,
                                  ),
                                  padding: EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/technician_icon.png"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Skilled Technicians",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: shadyGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 10,
                              ),
                              width: 120,
                              height: 130,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: Offset(0.5, 0.5),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/safety_icon.png"),
                                      ),
                                      color: white,
                                    ),
                                  ),
                                  Text(
                                    "Guaranteed Safety",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      color: shadyGrey,
                                    ),
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
              SizedBox(height: 30),
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: mainColor,
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/clients.png"),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 2,
                            height: 80,
                            color: white,
                          ),
                          SizedBox(width: 16),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Happy Clients",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.6),
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "94816",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.8),
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Completed Deals",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.6),
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "102370",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.8),
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            width: 2,
                            height: 80,
                            color: white,
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/deal.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/project.png"),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 2,
                            height: 80,
                            color: white,
                          ),
                          SizedBox(width: 16),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Running Projects",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.6),
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "579",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.8),
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Award Winning",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.6),
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "3226",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.8),
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            width: 2,
                            height: 80,
                            color: white,
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/award.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: width,
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width / 1.45,
                      child: SizedBox(
                        width: width / 1.2,
                        child: Text(
                          "Looking For A Fast & Reliable Repair Service",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: dimGrey,
                          ),
                        ),
                      ),
                    ),
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
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Estimate",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
