import 'package:Estimatewale/view/app/homepage.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/helpers/demo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class StorePage extends StatefulWidget {
  final String? city;
  const StorePage({Key? key, this.city}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  int totalPages = 20;

  @override
  void initState() {
    super.initState();
    stores();
    print("city name received ${widget.city}");
  }

  List data = [];

  int y = 0;

  String imageData = '';
  String videoData = '';

  int currentPage = 1;

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future stores({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPages) {
        refreshController.loadNoData();
        return true;
      }
    }

    String apiurl =
        "https://estimatewale.com/application/restapi/storedata.php?page=$currentPage&&cities=%22${widget.city}%22";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> phoneData = json.decode(response.body);

        setState(() {
          data = phoneData["body"];

          print("data of stores $data");
          print("store data is ${data.length}");
          currentPage++;
          totalPages = data.length;
          print("current page $currentPage $totalPages");
        });
      } else {
        jsonDecode("Not found any data");
        throw Exception("Failed to load brands data");
      }
    } on Exception catch (e) {
      print("erroe is $e");
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          Container(
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
                final result = await stores(isRefresh: true);
                if (result != null) {
                  refreshController.refreshCompleted();
                } else {
                  refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                final result = await stores();
                if (result != null) {
                  refreshController.loadComplete();
                } else {
                  refreshController.loadFailed();
                }
              },
              child: data.length > 1
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        y = data[0]["number_of_result"];
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => VideoDetailScreen(
                                    storeAddress: data[index]["address"],
                                    storeImage: data[index]["image"] == null
                                        ? "https://estimatewale.com/assets/images/dealers/1627452303_Important_Display_Message.jpg"
                                        : "https://estimatewale.com/assets/images/dealers/${data[index]["image"]}",
                                    storeName: data[index]["shopname"],
                                    storeContact: data[index]["contact"],
                                    storeEmail: data[index]["email"],
                                    storeExp: data[index]["shopyear"],
                                    storeUser: data[index]["username"],
                                    videourl: data[index]["videolink"] == null
                                        ? "https://www.youtube.com/watch?v=ePbL7jLAV1c"
                                        : data[index]["videolink"],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Container(
                                            height: 90,
                                            width: width / 3.5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  data[index]["image"] == null
                                                      ? "https://estimatewale.com/assets/images/dealers/1627452303_Important_Display_Message.jpg"
                                                      : "https://estimatewale.com/assets/images/dealers/${data[index]["image"]}",
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    width: width / 1.8,
                                                    child: Text(
                                                      data[index]["shopname"],
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    data[index]["username"],
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade500,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    data[index]["contact"],
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade500,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  SizedBox(
                                                    width: width / 1.8,
                                                    child: Text(
                                                      data[index]["address"],
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors
                                                            .grey.shade500,
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
                                      height: height / 26,
                                      width: width,
                                      decoration: BoxDecoration(
                                        color: mainColor1,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(4),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "View more",
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: mainColor,
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
                          ),
                        );
                      },
                    )
                  : Container(
                      height: height / 1.2,
                      child: Center(
                        child: SizedBox(
                          width: width / 1.4,
                          child: Text(
                            "No more stores are available in your city",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: shadyGrey,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     width: width,
          //     height: 60,
          //     decoration: BoxDecoration(
          //       color: mainColor1,
          //     ),
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: data.length,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.only(
          //               top: 10, bottom: 10, left: 5, right: 5),
          //           child: Container(
          //             height: 30,
          //             width: 30,
          //             decoration: BoxDecoration(
          //               color: mainColor,
          //               borderRadius: BorderRadius.circular(5),
          //             ),
          //             child: Center(
          //               child: Text(currentPage.toString()),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
