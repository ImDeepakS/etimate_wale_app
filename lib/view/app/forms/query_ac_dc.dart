import 'package:fix_team_app/view/app/forms/accepted_queries.dart';
import 'package:fix_team_app/view/app/forms/declined_queries.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QueryAcceptDeclinePage extends StatelessWidget {
  final String mobile, distance, problem, price;
  const QueryAcceptDeclinePage({
    Key? key,
    required this.mobile,
    required this.distance,
    required this.problem,
    required this.price,
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
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  padding: EdgeInsets.only(
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
                      SizedBox(height: 10),
                      ProbTextWidget(
                        label: "Mobile :",
                        text: mobile,
                      ),
                      ProbTextWidget(
                        label: "Distance in KM :",
                        text: distance,
                      ),
                      ProbTextWidget(
                        label: "Mobile Problem :",
                        text: problem,
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
                            "\$ " + price,
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
              ),
            ],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcceptedQueriesList(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 140,
                        child: Center(
                          child: Text(
                            "Accept",
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeclinedQueriesList(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 140,
                        child: Center(
                          child: Text(
                            "Reject",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
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
    );
  }
}
