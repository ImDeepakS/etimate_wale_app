import 'package:Estimatewale/controller/insert/inser_query_controller.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DealerProfilePage extends StatefulWidget {
  final String price;
  final String address;
  final String shopName;
  final String contactNumber;
  final String shopImage;
  final String brand;
  final String model;
  final String problem;
  final String brandid;
  final String modelid;
  final String problemid;
  final String dealerid;
  final String userid;
  const DealerProfilePage({
    Key? key,
    required this.price,
    required this.address,
    required this.shopName,
    required this.contactNumber,
    required this.shopImage,
    required this.brand,
    required this.model,
    required this.problem,
    required this.brandid,
    required this.modelid,
    required this.problemid,
    required this.dealerid,
    required this.userid,
  }) : super(key: key);

  @override
  _DealerProfilePageState createState() => _DealerProfilePageState();
}

class _DealerProfilePageState extends State<DealerProfilePage> {
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
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: width,
                        height: height / 4,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.shopImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              widget.shopName,
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
                                SizedBox(height: 5),
                                Text(
                                  widget.contactNumber,
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
                                  widget.address,
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
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Query",
                                style: GoogleFonts.poppins(
                                  color: dimGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: mainColor1,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.2),
                                      blurRadius: 1,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    ProbTextWidget(
                                      label: "Mobile :",
                                      text: widget.brand,
                                    ),
                                    ProbTextWidget(
                                      label: "Model :",
                                      text: widget.model,
                                    ),
                                    ProbTextWidget(
                                      label: "Problem :",
                                      text: widget.problem,
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: width,
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "\$ 500",
                                          style: GoogleFonts.poppins(
                                            color: green,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
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
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  insertQuery(
                    context,
                    widget.brandid,
                    widget.modelid,
                    widget.problemid,
                    widget.userid,
                    widget.dealerid,
                    "0",
                  );
                },
                child: Container(
                  height: height / 16,
                  width: width / 2,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Accept",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: white,
                      ),
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
