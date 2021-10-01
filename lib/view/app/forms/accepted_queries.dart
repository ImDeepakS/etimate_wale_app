import 'package:fix_team_app/model/dealer_query_model.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AcceptedQueriesList extends StatefulWidget {
  const AcceptedQueriesList({Key? key}) : super(key: key);

  @override
  State<AcceptedQueriesList> createState() => _AcceptedQueriesListState();
}

class _AcceptedQueriesListState extends State<AcceptedQueriesList> {
  List data = [];
  String mobileBrand = '';
  String mobileModel = '';
  String mobileProblem = '';

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future acceptedQueriesList() async {
    String apiurl =
        "https://estimatewale.com/application/restapi/accepted_queries.php";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> modelData = json.decode(response.body);

      setState(() {
        data = modelData["body"];
      });

      print("queries data is $data");
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
                        "Accepted Queries",
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
                          itemCount: dealerQueryData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dealerQueryData[index].srNo.toString(),
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
                                            label: "Brand :",
                                            text: dealerQueryData[index]
                                                .mobileName,
                                          ),
                                          ProbTextWidget(
                                            label: "Model :",
                                            text: dealerQueryData[index]
                                                .mobileName,
                                          ),
                                          ProbTextWidget(
                                            label: "Mobile Problem :",
                                            text:
                                                dealerQueryData[index].problem,
                                          ),
                                          ProbTextWidget(
                                            label: "Email :",
                                            text: "emailtest@email.com",
                                          ),
                                          ProbTextWidget(
                                            label: "Contact :",
                                            text: "00000000000",
                                          ),
                                          ProbTextWidget(
                                            label: "Price :",
                                            text: "estimate price",
                                          ),
                                          SizedBox(height: 10),
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
