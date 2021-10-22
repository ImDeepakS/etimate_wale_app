import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AcceptedQueriesList extends StatefulWidget {
  final String userID;
  const AcceptedQueriesList({Key? key, required this.userID}) : super(key: key);

  @override
  State<AcceptedQueriesList> createState() => _AcceptedQueriesListState();
}

class _AcceptedQueriesListState extends State<AcceptedQueriesList> {
  @override
  void initState() {
    super.initState();
    acceptedQueriesList(int.parse(widget.userID));
  }

  List data = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future acceptedQueriesList(int dealer) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/accepted_queries.php?dealerid=$dealer";
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
                      data.isEmpty
                          ? Text("")
                          : Text(
                              "Accepted Queries",
                              style: GoogleFonts.poppins(
                                color: dimGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      SizedBox(height: 20),
                      data.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 200),
                              child: Center(
                                child: Text(
                                  "No queries accepted",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: shadyGrey,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: height / 1.25,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: InkWell(
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
                                              label: "Brand :",
                                              text: data[index]["mobilebrand"],
                                            ),
                                            ProbTextWidget(
                                              label: "Model :",
                                              text: data[index]["mobilemodel"],
                                            ),
                                            ProbTextWidget(
                                              label: "Problem :",
                                              text: data[index]
                                                  ["singlemobileproblem"],
                                            ),
                                            data[index]["email"] == null
                                                ? ProbTextWidget(
                                                    label: "Email",
                                                    text: "No data found")
                                                : ProbTextWidget(
                                                    label: "Email :",
                                                    text: data[index]["email"],
                                                  ),
                                            data[index]["contact"] == null
                                                ? ProbTextWidget(
                                                    label: "Contact",
                                                    text: "No data found")
                                                : ProbTextWidget(
                                                    label: "Contact :",
                                                    text: data[index]
                                                        ["contact"],
                                                  ),
                                            SizedBox(height: 10),
                                            Container(
                                              width: width,
                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  data[index]["price"] == null
                                                      ? ProbTextWidget(
                                                          label: "Price",
                                                          text: "No data found")
                                                      : Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                                height: 10),
                                                            Html(
                                                              data: data[index]
                                                                  ["price"],
                                                              style: {
                                                                "ul": Style(
                                                                  listStyleType:
                                                                      ListStyleType
                                                                          .SQUARE,
                                                                  textDecoration:
                                                                      TextDecoration
                                                                          .none,
                                                                ),
                                                                "h1": Style(
                                                                  fontSize:
                                                                      FontSize
                                                                          .larger,
                                                                  color: black
                                                                      .withOpacity(
                                                                          0.4),
                                                                ),
                                                                "li": Style(
                                                                  color: black
                                                                      .withOpacity(
                                                                          0.4),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                "hr": Style(
                                                                  display:
                                                                      Display
                                                                          .NONE,
                                                                ),
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
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
