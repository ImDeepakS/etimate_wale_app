import 'package:fix_team_app/model/dealer_model.dart';
import 'package:fix_team_app/view/app/pages/dealer_profile.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DealersListPage extends StatefulWidget {
  final String brandid, modelid, problemid, brand, model, problem;
  const DealersListPage({
    Key? key,
    required this.brandid,
    required this.modelid,
    required this.problemid,
    required this.brand,
    required this.model,
    required this.problem,
  }) : super(key: key);

  @override
  _DealersListPageState createState() => _DealersListPageState();
}

class _DealersListPageState extends State<DealersListPage> {
  @override
  void initState() {
    super.initState();
    dealersList(widget.brandid, widget.modelid, widget.problemid);
  }

  List data = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future dealersList(brand, model, problem) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/nearby_repair_dealers.php?brand=$brand&&model=$model&&problem=$problem";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> dealersData = json.decode(response.body);

      setState(() {
        data = dealersData["body"];
      });

      print("dealers data is $data");
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
                            ? "https://freevector-images.s3.amazonaws.com/uploads/vector/preview/40568/vecteezyyellow-backgroundas0420_generated.jpg"
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
                                        ? "https://freevector-images.s3.amazonaws.com/uploads/vector/preview/40568/vecteezyyellow-backgroundas0420_generated.jpg"
                                        : dummyData[index].shopImage,
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
                                      color: green,
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
    );
  }
}
