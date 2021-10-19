import 'package:Estimatewale/view/app/pages/dealer_profile.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class DealersListPage extends StatefulWidget {
  final String brandid, modelid, problemid, brand, model, problem, userid;
  const DealersListPage({
    Key? key,
    required this.brandid,
    required this.modelid,
    required this.problemid,
    required this.brand,
    required this.model,
    required this.problem,
    required this.userid,
  }) : super(key: key);

  @override
  _DealersListPageState createState() => _DealersListPageState();
}

class _DealersListPageState extends State<DealersListPage> {
  RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  int currentPage = 1;
  int totalPages = 20;

  List data = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  String brand = '';
  String model = '';
  String problem = '';

  @override
  void initState() {
    super.initState();
    brand = widget.brandid;
    model = widget.modelid;
    problem = widget.problemid;
    dealersList();
  }

  Future dealersList({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages && totalPages < 1) {
        refreshController.loadNoData();
        return true;
      }
    }
    String apiurl =
        "https://estimatewale.com/application/restapi/nearby_dealers.php?brand=$brand&&model=$model&&problem=$problem&&page=$currentPage";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        Map<String, dynamic> dealersData = json.decode(response.body);
        setState(() {
          data = dealersData["body"];
          currentPage++;
          totalPages = data.length;
          print("total dealer is $totalPages");
        });

        print("dealers data is $data");
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
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          color: white,
        ),
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
            final result = await dealersList(isRefresh: true);
            if (result != null) {
              refreshController.refreshCompleted();
            } else {
              refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await dealersList();
            if (result != null) {
              refreshController.loadComplete();
            } else {
              refreshController.loadFailed();
            }
          },
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DealerProfilePage(
                          shopImage: data[index]["image"] == null
                              ? "https://estimatewale.com/assets/images/yellow_background.jpg"
                              : data[index]["image"],
                          address: data[index]["address"],
                          contactNumber: data[index]["contact"],
                          price: data[index]["price"],
                          shopName: data[index]["shopname"],
                          problem: widget.problem,
                          model: widget.model,
                          brand: widget.brand,
                          brandid: widget.brandid,
                          modelid: widget.modelid,
                          problemid: widget.problemid,
                          dealerid: data[index]["id"],
                          userid: widget.userid,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Container(
                      width: width,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height / 6.5,
                                width: width / 3.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data[index]["image"] == null
                                          ? "https://estimatewale.com/assets/images/yellow_background.jpg"
                                          : "https://estimatewale.com/assets/images/yellow_background.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 15,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: width / 2,
                                          child: Text(
                                            data[index]["shopname"],
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          data[index]["contact"].toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        SizedBox(
                                          width: width / 2,
                                          child: Text(
                                            data[index]["address"],
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: mainColor1,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                children: [
                                  Html(
                                    data: data[index]["price"],
                                    style: {
                                      "h2": Style(
                                        fontSize: FontSize.small,
                                        color: black.withOpacity(0.5),
                                      ),
                                      "h1": Style(
                                        fontSize: FontSize.large,
                                        color: black.withOpacity(0.5),
                                      ),
                                      "li": Style(
                                        fontSize: FontSize.small,
                                        color: black.withOpacity(0.4),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      "hr": Style(
                                        display: Display.NONE,
                                      ),
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
