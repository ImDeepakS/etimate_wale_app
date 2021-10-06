import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/app/pages/store_detail_page.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/helpers/demo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  void initState() {
    super.initState();
    stores();
  }

  List data = [];

  String imageData = '';
  String videoData = '';

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future stores() async {
    String apiurl =
        "https://estimatewale.com/application/restapi/store_list.php";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> phoneData = json.decode(response.body);

      setState(() {
        data = phoneData["body"];
        print("store data is $data");
      });
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          color: white,
        ),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    // MaterialPageRoute(
                    //   builder: (context) => StoreDetailsPage(
                    //     storeAddress: data[index]["address"],
                    //     storeImage: data[index]["image"] == null
                    //         ? "https://estimatewale.com/assets/images/dealers/1627452303_Important_Display_Message.jpg"
                    //         : "https://estimatewale.com/assets/images/dealers/${data[index]["image"]}",
                    //     storeName: data[index]["shopname"],
                    //     storeContact: data[index]["contact"],
                    //     storeEmail: data[index]["email"],
                    //     storeExp: data[index]["shopyear"],
                    //     storeUser: data[index]["username"],
                    //     videourl: data[index]["videolink"] == null
                    //         ? "no data"
                    //         : data[index]["videolink"],
                    //   ),
                    // ),
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
                                  ? "no data"
                                  : data[index]["videolink"],
                            )),
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
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: 90,
                                width: width / 3.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
                                        width: width / 1.8,
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
                                        data[index]["username"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        data[index]["contact"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      SizedBox(
                                        width: width / 1.8,
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
                              mainAxisAlignment: MainAxisAlignment.end,
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
        ),
      ),
    );
  }
}
