import 'package:Estimatewale/controller/update/update_status_query_controller.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class DealerAcceptQuerypage extends StatelessWidget {
  final String mobile,
      model,
      problem,
      price,
      brandid,
      modelid,
      problemid,
      userid,
      dealerid;
  const DealerAcceptQuerypage({
    Key? key,
    required this.mobile,
    required this.model,
    required this.problem,
    required this.price,
    required this.brandid,
    required this.modelid,
    required this.problemid,
    required this.userid,
    required this.dealerid,
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
                        label: "Model :",
                        text: model,
                      ),
                      ProbTextWidget(
                        label: "Problem :",
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
                        child: Html(
                          data: price.isEmpty ? null : price,
                          style: {
                            "h3": Style(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            "hr": Style(
                              backgroundColor: mainColor,
                            ),
                            "h1": Style(
                              fontSize: FontSize.large,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            "h2": Style(
                              fontSize: FontSize.large,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            "li": Style(
                              textDecoration: TextDecoration.none,
                              width: width / 1.5,
                            ),
                          },
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
                        updateQueryStatus(
                          context,
                          brandid,
                          modelid,
                          problemid,
                          userid,
                          dealerid,
                          "1",
                        );
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Center(
                          child: Text(
                            "Accept Query",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: green,
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
