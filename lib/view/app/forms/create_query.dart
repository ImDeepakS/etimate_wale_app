import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateQueryPage extends StatefulWidget {
  const CreateQueryPage({Key? key}) : super(key: key);

  @override
  _CreateQueryPageState createState() => _CreateQueryPageState();
}

class _CreateQueryPageState extends State<CreateQueryPage> {
  String phoneValue = 'HTC';
  String locationValue = '5 KM';
  String problemValue = 'Please Select The Option';
  String modelValue = 'Select The Option';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: dimGrey,
          ),
        ),
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
                                child: DropdownButton(
                                  value: phoneValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'HTC',
                                    'IPhone',
                                    'Nokia',
                                    'Oppo',
                                    'RealMe',
                                    'Samsung galaxy',
                                    'Vivo',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: dimGrey,
                                        ),
                                      ),
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
                                child: DropdownButton(
                                  value: phoneValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'HTC',
                                    'IPhone',
                                    'Nokia',
                                    'Oppo',
                                    'RealMe',
                                    'Samsung galaxy',
                                    'Vivo',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: dimGrey,
                                        ),
                                      ),
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
                                child: DropdownButton(
                                  value: phoneValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'HTC',
                                    'IPhone',
                                    'Nokia',
                                    'Oppo',
                                    'RealMe',
                                    'Samsung galaxy',
                                    'Vivo',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: dimGrey,
                                        ),
                                      ),
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
                                child: DropdownButton(
                                  value: phoneValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      phoneValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'HTC',
                                    'IPhone',
                                    'Nokia',
                                    'Oppo',
                                    'RealMe',
                                    'Samsung galaxy',
                                    'Vivo',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: dimGrey,
                                        ),
                                      ),
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
