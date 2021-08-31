import 'package:fix_team_app/controller/user/register_user_controller.dart';
import 'package:fix_team_app/model/user_register_model.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:fix_team_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: width,
              decoration: BoxDecoration(color: white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/login-art.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      "Sign Up",
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
                          LabelText(label: "Please Enter Username"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            controller: usernameController,
                            hint: "Enter username",
                            inputType: TextInputType.name,
                            message: "Username is empty",
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Please Enter Email"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            controller: emailController,
                            hint: "Enter Email",
                            inputType: TextInputType.emailAddress,
                            message: "Email is empty",
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Please Enter Phone number"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            controller: phoneController,
                            hint: "Enter Phone number",
                            inputType: TextInputType.phone,
                            message: "Phone number is empty",
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Please Enter Password"),
                          SizedBox(height: 10),
                          PasswordFieldWidget(
                            controller: passwordController,
                            securetext: true,
                            hint: "Enter Password",
                            inputType: TextInputType.phone,
                            message: "Password is empty",
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Please Enter Password Again"),
                          SizedBox(height: 10),
                          PasswordFieldWidget(
                            controller: confirmPasswordController,
                            securetext: true,
                            hint: "Enter Password",
                            inputType: TextInputType.phone,
                            message: "Password not match",
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
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        // createUser();
                        registerUser(
                          context,
                          usernameController.text,
                          emailController.text,
                          phoneController.text,
                          passwordController.text,
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
                        });
                      });
                    }
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
