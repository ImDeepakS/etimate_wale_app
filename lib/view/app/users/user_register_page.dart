import 'dart:convert';

import 'package:fix_team_app/controller/user/register_user_controller.dart';
import 'package:fix_team_app/model/user_register_model.dart';
import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/app/loginpage.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:fix_team_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({Key? key}) : super(key: key);

  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool userCreated = false;

  Future<User>? _futureUser;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Sign Up",
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
                      height: height / 0.89,
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
                                        width: width / 20,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        height: 2,
                                        width: width / 8.5,
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
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelText(label: "Username"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Username can't be empty",
                                    controller: usernameController,
                                    inputType: TextInputType.name,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Email"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Email can't be empty",
                                    controller: emailController,
                                    inputType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Phone"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Phone can't be empty",
                                    controller: phoneController,
                                    inputType: TextInputType.phone,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Password"),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.red.shade700,
                                          width: 2,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(30),
                                    ],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade600,
                                      letterSpacing: 2,
                                    ),
                                    validator: (String? value) {
                                      if (value != null && value.isEmpty) {
                                        return "Password can't be empty";
                                      }
                                      return null;
                                    },
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Confirm Password"),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.red.shade700,
                                          width: 2,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(30),
                                    ],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade600,
                                      letterSpacing: 2,
                                    ),
                                    validator: (String? value) {
                                      if (confirmPasswordController.text !=
                                              passwordController.text ||
                                          value != null && value.isEmpty) {
                                        return "Password doesn't match or empty";
                                      }
                                      return null;
                                    },
                                    controller: confirmPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Zipcode"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Zipcode can't be empty",
                                    controller: zipcodeController,
                                    inputType: TextInputType.number,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Address"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Address can't be empty",
                                    controller: addressController,
                                    inputType: TextInputType.streetAddress,
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
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      onTap: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            // createUser();
                            registerUser(
                              context,
                              usernameController.text,
                              emailController.text,
                              phoneController.text,
                              passwordController.text,
                              zipcodeController.text,
                              addressController.text,
                            );
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     content: Text("User created successfully"),
                            //     backgroundColor: Colors.green,
                            //   ),
                            // );
                            this.setState(() {
                              usernameController.clear();
                              emailController.clear();
                              phoneController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
                              zipcodeController.clear();
                              addressController.clear();
                            });
                          });
                        }
                      },
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
