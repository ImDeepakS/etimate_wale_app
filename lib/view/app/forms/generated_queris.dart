import 'dart:convert';
import 'package:fix_team_app/view/app/forms/update_query_price.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

class GeneratedQueriesList extends StatefulWidget {
  const GeneratedQueriesList({Key? key}) : super(key: key);

  @override
  State<GeneratedQueriesList> createState() => _GeneratedQueriesListState();
}

class _GeneratedQueriesListState extends State<GeneratedQueriesList> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    fetchTen();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchTen();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  List data = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  fetchTen() {
    for (var i = 0; i < 10; i++) {
      queriesList(36);
    }
  }

  Future queriesList(int userid) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/list_queries.php?user_id=$userid";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> estimateQueryData = json.decode(response.body);

      setState(() {
        data = estimateQueryData["body"];
      });

      print("data is $data");
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
                      Text(
                        "Your Estimate Price List",
                        style: GoogleFonts.poppins(
                          color: dimGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: height,
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]["id"],
                                    style: GoogleFonts.poppins(
                                      color: dimGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateQueryPricepage(
                                            mobile: data[index]["mobilebrand"],
                                            model: data[index]["mobilemodel"],
                                            problem: data[index]
                                                ["singlemobileproblem"],
                                            price: data[index]["price"],
                                            mobileid: data[index]["brand"],
                                            modelid: data[index]["model"],
                                            problemid: data[index]["problem"],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: width / 1.3,
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
                                          SizedBox(height: 5),
                                          ProbTextWidget(
                                            label: "Mobile :",
                                            text: data[index]["mobilebrand"],
                                          ),
                                          ProbTextWidget(
                                            label: "Mobile :",
                                            text: data[index]["mobilemodel"],
                                          ),
                                          ProbTextWidget(
                                            label: "Problem",
                                            text: data[index]
                                                ["singlemobileproblem"],
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
                                              data: data[index]["price"],
                                              style: {
                                                "h3": Style(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                "hr": Style(
                                                  backgroundColor: mainColor,
                                                ),
                                                "h1": Style(
                                                  fontSize: FontSize.large,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                "h2": Style(
                                                  fontSize: FontSize.large,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                                "li": Style(
                                                  textDecoration:
                                                      TextDecoration.none,
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
                            );
                          },
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
