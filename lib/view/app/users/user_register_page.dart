import 'package:fix_team_app/view/app/forms/create_query.dart';
import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:fix_team_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({Key? key}) : super(key: key);

  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  TextEditingController? usernameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  TextEditingController? zipcodeController;
  TextEditingController? addressController;

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
                      height: height / 1,
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
                                  TextFieldWidget(
                                    message: "Password can't be empty",
                                    controller: passwordController,
                                    inputType: TextInputType.visiblePassword,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Confirm Password"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Confirm Password can't be empty",
                                    controller: confirmPasswordController,
                                    inputType: TextInputType.text,
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
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => CreateQueryPage(),
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
