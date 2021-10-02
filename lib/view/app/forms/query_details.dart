import 'dart:convert';
import 'package:fix_team_app/view/app/pages/dealers_list.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:fix_team_app/view/widgets/prob_text_widget.dart';
import 'package:fix_team_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

class DetailedQuery extends StatefulWidget {
  final String brand, model, problem;
  final int brandid, modelid, problemid;
  const DetailedQuery({
    Key? key,
    required this.brand,
    required this.model,
    required this.problem,
    required this.brandid,
    required this.modelid,
    required this.problemid,
  }) : super(key: key);

  @override
  State<DetailedQuery> createState() => _DetailedQueryState();
}

class _DetailedQueryState extends State<DetailedQuery> {
  @override
  void initState() {
    super.initState();
    priceDetail(widget.brandid, widget.modelid, widget.problemid);
  }

  String location = 'Null, Press Button';
  String address = 'search';
  String city = 'Get Location';
  String zipcode = '';
  String lat = '';
  String lng = '';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    Placemark place = placemarks[0];
    city = '${place.subLocality}, ${place.locality}';
    zipcode = '${place.postalCode}';
    lat = '${position.latitude}';
    lng = '${position.longitude}';
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  List data = [];

  Map<String, String> headers = {
    'content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future priceDetail(int brand, model, problem) async {
    String apiurl =
        "https://estimatewale.com/application/restapi/single_detail.php?cat_brands=$brand&&cat_models=$model&&mobileproblem=$problem";
    var response = await http.get(Uri.parse(apiurl), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> phoneData = json.decode(response.body);

      setState(() {
        data = phoneData["body"];
      });

      print("price data is $data");
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                            "Your Query",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: width / 1.13,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ProbTextWidget(
                                              label: "Mobile :",
                                              text: widget.brand,
                                            ),
                                            ProbTextWidget(
                                              label: "Mobile Model :",
                                              text: widget.model,
                                            ),
                                            ProbTextWidget(
                                              label: "Mobile Problem :",
                                              text: widget.problem,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: 10,
                                                right: 10,
                                                bottom: 10,
                                              ),
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Description",
                                                    style: GoogleFonts.poppins(
                                                      color: shadyGrey,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  SizedBox(
                                                    child: Html(
                                                      data: data[0]
                                                          ["description"],
                                                      style: {
                                                        "p": Style(
                                                          color: black
                                                              .withOpacity(0.4),
                                                          fontSize:
                                                              FontSize(14),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 0.5,
                                                          lineHeight:
                                                              LineHeight(1.5),
                                                        ),
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              width: width,
                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                                            SizedBox(height: 20),
                                            LabelText(label: "Select Location"),
                                            SizedBox(height: 10),
                                            InkWell(
                                              onTap: () async {
                                                Position position =
                                                    await _getGeoLocationPosition();
                                                location =
                                                    'Lat: ${position.latitude} , Long: ${position.longitude}';
                                                getAddressFromLatLong(position);
                                              },
                                              child: TextFieldWidget(
                                                enable: false,
                                                hint: address,
                                                inputType: TextInputType.phone,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
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
                        "View Nearby Shop",
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
