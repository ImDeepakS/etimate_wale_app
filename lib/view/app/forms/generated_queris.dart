import 'dart:convert';
import 'package:fix_team_app/controller/lists/single_brand_controller.dart';
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
  @override
  void initState() {
    super.initState();
    queriesList(3);
  }

  List data = [];
  List brandsData = [];
  List modelsData = [];
  List problemsData = [];
  List mainArr = [];
  String mobileBrand = '';
  String mobileModel = '';
  String mobileProblem = '';
  String mobilePrice = '';

  String brandName = '';
  String modelname = '';
  String problemname = '';

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future queriesList(int userid) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/list_queries.php?user_id=$userid";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> modelData = json.decode(response.body);

      setState(() {
        data = modelData["body"];
        mobileBrand = data[0]["brand"];
        mobileModel = data[0]["model"];
        mobileProblem = data[0]["problem"];
        mobilePrice = data[0]["price"];
      });

      String brandUrl =
          "https://estimatewale.com/application/restapi/single_brand.php?id=$mobileBrand";
      var brandRes = await http.get(Uri.parse(brandUrl), headers: headers);

      if (brandRes.statusCode == 200) {
        Map<String, dynamic> brandData = json.decode(brandRes.body);
        setState(() {
          brandsData = brandData["body"];

          brandName = brandsData[0]["mobilebrand"];
        });
        print("main array is $mainArr");

        String problemUrl =
            "https://estimatewale.com/application/restapi/single_mobile_problem.php?id=$mobileModel";

        var problemRes =
            await http.get(Uri.parse(problemUrl), headers: headers);

        if (problemRes.statusCode == 200) {
          Map<String, dynamic> problemData = json.decode(problemRes.body);

          setState(() {
            problemsData = problemData["body"];

            problemname = problemsData[0]["singlemobileproblem"];

            mainArr = [brandName, problemname, mobilePrice];
          });
          print("problem data is $mainArr");
        }
      }
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
                        "Your Queries",
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateQueryPricepage(
                                            mobile: data[index]["brand"],
                                            problem: data[index]["problem"],
                                            price: data[index]["price"],
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
                                          ProbTextWidget(
                                            label: "Mobile :",
                                            text: data[index]["brand"],
                                          ),
                                          ProbTextWidget(
                                            label: "Mobile Problem :",
                                            text: data[index]["problem"],
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
