import 'dart:convert';

import 'package:fix_team_app/model/dealer_query_model.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class DeclinedQueriesList extends StatefulWidget {
  const DeclinedQueriesList({Key? key}) : super(key: key);

  @override
  State<DeclinedQueriesList> createState() => _DeclinedQueriesListState();
}

class _DeclinedQueriesListState extends State<DeclinedQueriesList> {
  List data = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future allQueriesList(int userid) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/user_queries_in_queue.php?userid=$userid";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> modelData = json.decode(response.body);

      setState(() {
        data = modelData["body"];
      });

      print("all queries data is $data");
    } else {
      jsonDecode("Not found any data");
      throw Exception("Failed to load brands data");
    }
  }

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
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      data.isEmpty
                          ? Text("")
                          : Text(
                              "Queries in queue",
                              style: GoogleFonts.poppins(
                                color: dimGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      SizedBox(height: 20),
                      data.isNotEmpty
                          ? Container(
                              height: height,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index]["id"],
                                          style: GoogleFonts.poppins(
                                            color: dimGrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          child: Container(
                                            width: width / 1.21,
                                            padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              color: mainColor1,
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                                  text: data[index]
                                                      ["mobilebrand"],
                                                ),
                                                ProbTextWidget(
                                                  label: "Model :",
                                                  text: data[index]
                                                      ["mobilemodel"],
                                                ),
                                                ProbTextWidget(
                                                  label: "Problem :",
                                                  text: data[index]
                                                      ["singlemobileproblem"],
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                    color: mainColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "\$ " +
                                                          dealerQueryData[index]
                                                              .amount,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: green,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                  );
                                },
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 200),
                              child: Center(
                                child: Text(
                                  "No orders are in queue",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: shadyGrey,
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
        ),
      ),
    );
  }
}
