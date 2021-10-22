import 'package:Estimatewale/view/app/forms/dealer_ac_dc_query.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/label_widget.dart';
import 'package:Estimatewale/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DealerUserQueryPage extends StatefulWidget {
  final String userid;
  const DealerUserQueryPage({Key? key, required this.userid}) : super(key: key);

  @override
  _DealerUserQueryPageState createState() => _DealerUserQueryPageState();
}

class _DealerUserQueryPageState extends State<DealerUserQueryPage> {
  @override
  void initState() {
    super.initState();
    allQueriesList(int.parse(widget.userid));
  }

  List data = [];
  String mobileBrand = '';
  String mobileModel = '';
  String mobileProblem = '';

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future allQueriesList(int dealer) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/wait_to_accept_queries.php?dealerid=$dealer";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> modelData = json.decode(response.body);

        setState(() {
          data = modelData["body"];
        });

        print("all queries data is $data");
      } else {
        jsonDecode("Not found any data");
        // throw Exception("Failed to load brands data");
      }
    } catch (e) {}
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
                              "User Queries",
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
                                  "No queries received",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: shadyGrey,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: height,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DealerAcceptQuerypage(
                                              mobile: data[index]
                                                  ["mobilebrand"],
                                              model: data[index]["mobilemodel"],
                                              problem: data[index]
                                                  ["singlemobileproblem"],
                                              price:
                                                  data[index]["price"] == null
                                                      ? "0"
                                                      : data[index]["price"],
                                              userid: data[index]["userid"],
                                              dealerid: data[index]["dealerid"],
                                              brandid: data[index]["brandid"],
                                              modelid: data[index]["modelid"],
                                              problemid: data[index]
                                                  ["Problemid"],
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
                                            data[index]["price"] == null
                                                ? ProbTextWidget(
                                                    label: "Price",
                                                    text: "No data found")
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 10),
                                                      LabelText(
                                                          label: "Price :"),
                                                      Container(
                                                        width: width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: mainColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Html(
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
                                                              fontSize: FontSize
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
                                                                  Display.NONE,
                                                            ),
                                                          },
                                                        ),
                                                      ),
                                                    ],
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
