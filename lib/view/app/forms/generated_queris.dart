import 'dart:convert';
import 'package:Estimatewale/view/app/forms/update_query_price.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/prob_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GeneratedQueriesList extends StatefulWidget {
  final String userid;
  const GeneratedQueriesList({Key? key, required this.userid})
      : super(key: key);

  @override
  State<GeneratedQueriesList> createState() => _GeneratedQueriesListState();
}

class _GeneratedQueriesListState extends State<GeneratedQueriesList> {
  RefreshController refreshController = RefreshController(initialRefresh: true);
  @override
  void initState() {
    super.initState();

    setState(() {
      user_id = widget.userid;
    });
    queriesList();
  }

  String user_id = '';

  @override
  void dispose() {
    super.dispose();
  }

  List data = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  int totalPages = 10;
  int currentPage = 1;

  Future deleteTmpData() async {
    try {
      final response = await http.post(
        Uri.parse(
          "https://estimatewale.com/application/restapi/empty_tmptable.php",
        ),
      );
      var message = jsonDecode(json.encode(response.body));

      if (response.statusCode == 200) {
        print("message received delete $message");
      } else {}
    } on Exception catch (e) {
      print("Exception is: " + e.toString());
    }
  }

  Future queriesList({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return true;
      }
    }

    String apiurl =
        "https://estimatewale.com/application/restapi/list.php?user_id=$user_id&&page=$currentPage";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> estimateQueryData = json.decode(response.body);

      setState(() {
        data = estimateQueryData["body"];
        currentPage++;
        totalPages = data.length;
        print("total estimate is $currentPage");
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
            deleteTmpData();
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
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height / 1.2,
                        child: SmartRefresher(
                          footer: ClassicFooter(
                            failedText: "Loading Complete",
                            failedIcon: Icon(
                              Icons.check_circle,
                              color: shadyGrey,
                            ),
                            loadStyle: LoadStyle.ShowWhenLoading,
                          ),
                          controller: refreshController,
                          enablePullUp: true,
                          enablePullDown: true,
                          onRefresh: () async {
                            final result = await queriesList(isRefresh: true);
                            if (result != null) {
                              refreshController.refreshCompleted();
                            } else {
                              refreshController.refreshFailed();
                            }
                          },
                          onLoading: () async {
                            final result = await queriesList();
                            if (result != null) {
                              refreshController.loadComplete();
                            } else if (result == null) {
                              refreshController.loadFailed();
                            }
                          },
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
                                            UpdateQueryPricepage(
                                          mobile: data[index]["mobilebrand"],
                                          model: data[index]["mobilemodel"],
                                          problem: data[index]
                                              ["singlemobileproblem"],
                                          price: data[index]["price"],
                                          mobileid: data[index]["brand"],
                                          modelid: data[index]["model"],
                                          problemid: data[index]["problem"],
                                          userid: widget.userid,
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
                                          text:
                                              data[index]["mobilemodel"] == null
                                                  ? "model not found"
                                                  : data[index]["mobilemodel"],
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
                                              "p": Style(
                                                fontSize: FontSize.large,
                                                color: black.withOpacity(0.4),
                                                fontStyle: FontStyle.normal,
                                              ),
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
