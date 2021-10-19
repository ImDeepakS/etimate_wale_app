import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QueriesListPage extends StatefulWidget {
  final String userid;
  const QueriesListPage({Key? key, required this.userid}) : super(key: key);

  @override
  _QueriesListPageState createState() => _QueriesListPageState();
}

class _QueriesListPageState extends State<QueriesListPage> {
  @override
  void initState() {
    super.initState();
    allQueriesList(int.parse(widget.userid));
  }

  List data = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future allQueriesList(int userid) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/user_queries_list.php?userid=$userid";
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
