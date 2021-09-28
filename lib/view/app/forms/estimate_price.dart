import 'dart:convert';

import 'package:fix_team_app/controller/lists/mobile_controller.dart';
import 'package:fix_team_app/model/mobile_brand_model.dart';
import 'package:fix_team_app/view/app/pages/dealers_list.dart';
import 'package:fix_team_app/view/app/pages/profile_page.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class EstimatePricePage extends StatefulWidget {
  const EstimatePricePage({Key? key}) : super(key: key);

  @override
  _EstimatePricePageState createState() => _EstimatePricePageState();
}

class _EstimatePricePageState extends State<EstimatePricePage> {
  String phoneValue = '';
  String locationValue = '5 KM';
  String problemValue = 'Please Select The Option';
  String modelValue = 'Select The Option';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phoneBrand();
  }

  List data = [];

  Future phoneBrand() async {
    String apiurl =
        "https://estimatewale.com/application/restapi/phone_list.php";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> phoneData = json.decode(response.body);

      setState(() {
        data = phoneData["body"];
      });

      print("data is $data");
    } else {
      jsonDecode("Not found any data");
      throw Exception("Failed to load brands data");
    }
  }

  // Future getMobile() async {
  //   try {
  //     String apiurl =
  //         "https://estimatewale.com/application/restapi/phone_list.php";
  //     var response = await http
  //         .get(Uri.parse(apiurl), headers: {"Accept": "application/json"});

  //     var jsonBody = response.body;
  //     var jsonData = json.decode(jsonEncode(jsonBody));

  //     setState(() {
  //       data = (jsonData as List<dynamic>).cast<String>();
  //     });

  //     print("json data received $jsonData");
  //     return "success";
  //   } catch (e) {
  //     // throw Exception(e);
  //     print(e);
  //   }
  // }

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
            child: Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(color: white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/estimate.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "Estimate Price",
                      style: GoogleFonts.poppins(
                        color: dimGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelText(label: "Select Mobile Brand"),
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(width: 1, color: dimGrey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            width: width,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: phoneValue == null ? null : phoneValue,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('Select City'),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                      print("phone value is $phoneValue");
                                    });
                                  },
                                  items: data.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['mobilebrand']),
                                      value: item['id'].toString(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          LabelText(label: "Select Mobile Model"),
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(width: 1, color: dimGrey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            width: width,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: null,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('Select City'),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                      print("phone value is $phoneValue");
                                    });
                                  },
                                  items: data.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['mobilebrand']),
                                      value: item['id'].toString(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          LabelText(label: "Select Mobile Problem"),
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(width: 1, color: dimGrey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            width: width,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: null,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('Select City'),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                      print("phone value is $phoneValue");
                                    });
                                  },
                                  items: data.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['mobilebrand']),
                                      value: item['id'].toString(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          LabelText(label: "Select Distance"),
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(width: 1, color: dimGrey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0.5, 0.5),
                                ),
                              ],
                            ),
                            width: width,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: null,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('Select City'),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                      print("phone value is $phoneValue");
                                    });
                                  },
                                  items: data.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['mobilebrand']),
                                      value: item['id'].toString(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    FocusManager.instance.primaryFocus!.unfocus();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DealersListPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
