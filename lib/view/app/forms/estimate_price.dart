import 'dart:convert';
import 'package:fix_team_app/view/app/pages/dealers_list.dart';
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
  String locationValue = '';
  String problemValue = '';
  String modelValue = '';

  String phoneValueStore = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phoneBrand();
    // phoneModel();
    probModel();
  }

  List data = [];
  List dataModel = [];
  List problemModel = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

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

  Future phoneModel(int cat_brands) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/mobile_models.php?cat_brands=$cat_brands";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> modelData = json.decode(response.body);

      setState(() {
        dataModel = modelData["body"];
      });

      print("model data is $dataModel");
    } else {
      jsonDecode("Not found any data");
      throw Exception("Failed to load brands data");
    }
  }

  Future probModel() async {
    String apiurl =
        "https://estimatewale.com/application/restapi/single_problem.php";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> modelData = json.decode(response.body);

      setState(() {
        problemModel = modelData["body"];
      });

      print("problem data is $problemModel");
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
                          SizedBox(height: 50),
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
                                  value: phoneValue.isEmpty ? null : phoneValue,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('Select Mobile Brand'),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                      print("phone value is $phoneValue");
                                      phoneModel(int.parse(phoneValue));
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
                                  value: modelValue.isEmpty ? null : modelValue,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('Select Mobile Model'),
                                  onChanged: (String? newValue) {
                                    if (mounted) {
                                      try {
                                        setState(() {
                                          modelValue = newValue!;
                                          print("model value is $modelValue");
                                        });
                                      } catch (e) {
                                        print("Exception $e");
                                      }
                                    }
                                  },
                                  items: dataModel.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item['mobilemodel']),
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
                                  value: problemValue.isEmpty
                                      ? null
                                      : problemValue,
                                  iconSize: 30,
                                  icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text('Select City'),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      problemValue = newValue!;
                                      print("problem value is $problemValue");
                                    });
                                  },
                                  items: problemModel.map((item) {
                                    return new DropdownMenuItem(
                                      child: SizedBox(
                                          width: width / 2,
                                          child: new Text(
                                              item['singlemobileproblem'])),
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
