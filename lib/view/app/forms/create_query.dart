import 'package:fix_team_app/view/app/forms/create_query.dart';
import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/app/pages/dealers_list.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:fix_team_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Create Query",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        decoration: BoxDecoration(color: Colors.grey.shade300),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    // color: Colors.grey.shade300,
                    ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: height / 1.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        color: Color(0xFFf7e841),
                                        height: 2,
                                        width: width / 14,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        height: 2,
                                        width: width / 6.5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 30,
                              bottom: 20,
                            ),
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelText(label: "Mobile Brand"),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(5),
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
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  LabelText(label: "Mobile Model"),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    width: width,
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          value: modelValue,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              modelValue = newValue!;
                                            });
                                          },
                                          items: <String>[
                                            'Select The Option',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  LabelText(label: "Mobile Problem"),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    width: width,
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          value: problemValue,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              problemValue = newValue!;
                                            });
                                          },
                                          items: <String>[
                                            'Please Select The Option',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  LabelText(label: "Distance Km"),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    width: width,
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          value: locationValue,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              locationValue = newValue!;
                                            });
                                          },
                                          items: <String>[
                                            '5 KM',
                                            '10 KM',
                                            '15 KM',
                                            '40 KM',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
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
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => DealersListPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 60,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
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
