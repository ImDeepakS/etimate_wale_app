import 'package:fix_team_app/view/app/forms/dealer_ac_dc_query.dart';
import 'package:fix_team_app/view/app/forms/update_query_price.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:fix_team_app/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DealerUserQueryPage extends StatefulWidget {
  const DealerUserQueryPage({Key? key}) : super(key: key);

  @override
  _DealerUserQueryPageState createState() => _DealerUserQueryPageState();
}

class _DealerUserQueryPageState extends State<DealerUserQueryPage> {
  @override
  void initState() {
    super.initState();
    allQueriesList(5);
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
                        "User Queries",
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DealerAcceptQuerypage(
                                            mobile: data[index]["mobilebrand"],
                                            model: data[index]["mobilemodel"],
                                            problem: data[index]
                                                ["singlemobileproblem"],
                                            price: data[index]["price"] == null
                                                ? "0"
                                                : data[index]["price"],
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
                                            text: "sdflkjdf",
                                          ),
                                          ProbTextWidget(
                                            label: "Mobile :",
                                            text: "kjdshkjhgkdf",
                                          ),
                                          ProbTextWidget(
                                            label: "Problem",
                                            text: "idsyutfiusyfi",
                                          ),
                                          data[index]["price"] == null
                                              ? ProbTextWidget(
                                                  label: "Price",
                                                  text: "No data found")
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 10),
                                                    LabelText(label: "Price :"),
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
                                                              FontSize.larger,
                                                          color: black
                                                              .withOpacity(0.4),
                                                        ),
                                                        "li": Style(
                                                          color: black
                                                              .withOpacity(0.4),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      },
                                                    ),
                                                  ],
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
