import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:fix_team_app/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

enum MobileBrands { all, iphone, samsung, oppo, vivo, mi, honor, other }

enum Products {
  iphone_repair,
  touch_change,
  edge_glass,
  fast_service,
  all,
  none,
  other
}

enum Agree { yes, no, other }

class DealerRegisterPage extends StatefulWidget {
  const DealerRegisterPage({Key? key}) : super(key: key);

  @override
  _DealerRegisterPageState createState() => _DealerRegisterPageState();
}

class _DealerRegisterPageState extends State<DealerRegisterPage> {
  MobileBrands? _brands = MobileBrands.all;

  Products? _products = Products.iphone_repair;

  Agree? _agree = Agree.yes;

  TextEditingController? usernameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? phoneController1;
  TextEditingController? shopNameController;
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
          "Dealer Sign Up",
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
                      height: height * 3.2,
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
                                        width: width / 10,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        height: 2,
                                        width: width / 5.5,
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
                                  LabelText(label: "Shop Owner Name"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Owner Name can't be empty",
                                    controller: usernameController,
                                    inputType: TextInputType.name,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Contact Number"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Contact number can't be empty",
                                    controller: phoneController,
                                    inputType: TextInputType.phone,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Contact Number 1"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Contact number 1 can't be empty",
                                    controller: phoneController1,
                                    inputType: TextInputType.phone,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Shop Name"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Shop name can't be empty",
                                    controller: shopNameController,
                                    inputType: TextInputType.phone,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Address"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Address can't be empty",
                                    controller: addressController,
                                    inputType: TextInputType.streetAddress,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Landline Number"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Landline number can't be empty",
                                    controller: phoneController,
                                    inputType: TextInputType.phone,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Email Address"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Email Address can't be empty",
                                    controller: emailController,
                                    inputType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Facebook ID"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Facebook ID can't be empty",
                                    controller: phoneController,
                                    inputType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(label: "Instagram ID"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Instagram ID can't be empty",
                                    controller: phoneController,
                                    inputType: TextInputType.phone,
                                  ),
                                  SizedBox(height: 20),
                                  LabelText(
                                      label: "Shop From Last How Many Years?"),
                                  SizedBox(height: 10),
                                  TextFieldWidget(
                                    message: "Shop Years can't be empty",
                                    controller: phoneController,
                                    inputType: TextInputType.phone,
                                  ),
                                  SizedBox(height: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelText(
                                          label:
                                              "Which Mobile Brands You Can Repair?"),
                                      SizedBox(height: 10),
                                      RadioListTile<MobileBrands>(
                                        title: const Text(
                                          'ALL',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: MobileBrands.all,
                                        groupValue: _brands,
                                        onChanged: (MobileBrands? value) {
                                          setState(() {
                                            _brands = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<MobileBrands>(
                                        title: const Text(
                                          'IPHONE',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: MobileBrands.iphone,
                                        groupValue: _brands,
                                        onChanged: (MobileBrands? value) {
                                          setState(() {
                                            _brands = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<MobileBrands>(
                                        title: const Text(
                                          'SAMSUNG',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: MobileBrands.samsung,
                                        groupValue: _brands,
                                        onChanged: (MobileBrands? value) {
                                          setState(() {
                                            _brands = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<MobileBrands>(
                                        title: const Text(
                                          'OPPO',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: MobileBrands.oppo,
                                        groupValue: _brands,
                                        onChanged: (MobileBrands? value) {
                                          setState(() {
                                            _brands = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<MobileBrands>(
                                        title: const Text(
                                          'VIVO',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: MobileBrands.vivo,
                                        groupValue: _brands,
                                        onChanged: (MobileBrands? value) {
                                          setState(() {
                                            _brands = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<MobileBrands>(
                                        title: const Text(
                                          'MI',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: MobileBrands.mi,
                                        groupValue: _brands,
                                        onChanged: (MobileBrands? value) {
                                          setState(() {
                                            _brands = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<MobileBrands>(
                                        title: const Text(
                                          'HONOR',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: MobileBrands.honor,
                                        groupValue: _brands,
                                        onChanged: (MobileBrands? value) {
                                          setState(() {
                                            _brands = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<MobileBrands>(
                                        title: const Text(
                                          'Others',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: MobileBrands.other,
                                        groupValue: _brands,
                                        onChanged: (MobileBrands? value) {
                                          setState(() {
                                            _brands = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelText(
                                          label:
                                              "Are You Specialist In Any Of Below Product?"),
                                      SizedBox(height: 10),
                                      RadioListTile<Products>(
                                        title: const Text(
                                          'IPHONE REPAIR SPECIALIST',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Products.iphone_repair,
                                        groupValue: _products,
                                        onChanged: (Products? value) {
                                          setState(() {
                                            _products = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<Products>(
                                        title: const Text(
                                          'FRONT GLASS AND TOUCH CHANGE SPECIALIST',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Products.touch_change,
                                        groupValue: _products,
                                        onChanged: (Products? value) {
                                          setState(() {
                                            _products = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<Products>(
                                        title: const Text(
                                          'EDGE GLASS CHANGE SPECIALIST',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Products.edge_glass,
                                        groupValue: _products,
                                        onChanged: (Products? value) {
                                          setState(() {
                                            _products = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<Products>(
                                        title: const Text(
                                          'SPECIALIST TO GIVE FAST SERVICE TO OUR CUSTOMERS',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Products.fast_service,
                                        groupValue: _products,
                                        onChanged: (Products? value) {
                                          setState(() {
                                            _products = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<Products>(
                                        title: const Text(
                                          'ALL OF THE ABOVE',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Products.all,
                                        groupValue: _products,
                                        onChanged: (Products? value) {
                                          setState(() {
                                            _products = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<Products>(
                                        title: const Text(
                                          'NONE OF THESE',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Products.none,
                                        groupValue: _products,
                                        onChanged: (Products? value) {
                                          setState(() {
                                            _products = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<Products>(
                                        title: const Text(
                                          'Others',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Products.other,
                                        groupValue: _products,
                                        onChanged: (Products? value) {
                                          setState(() {
                                            _products = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelText(
                                          label:
                                              "YOU ARE AGREE IF WE GIVE YOUR CONTACT DETAIL TO OUR CUSTOMERS WITH THE SAME PRICE WHICH WE UPDATE ON WEBSITE?"),
                                      SizedBox(height: 10),
                                      RadioListTile<Agree>(
                                        title: const Text(
                                          'YES',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Agree.yes,
                                        groupValue: _agree,
                                        onChanged: (Agree? value) {
                                          setState(() {
                                            _agree = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<Agree>(
                                        title: const Text(
                                          'NO',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Agree.no,
                                        groupValue: _agree,
                                        onChanged: (Agree? value) {
                                          setState(() {
                                            _agree = value;
                                          });
                                        },
                                      ),
                                      RadioListTile<Agree>(
                                        title: const Text(
                                          'Others',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        value: Agree.other,
                                        groupValue: _agree,
                                        onChanged: (Agree? value) {
                                          setState(() {
                                            _agree = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  LabelText(
                                      label: "Add Photograph Of Your Shop"),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        child: Text(
                                          "Choose File",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text("No File Choosen"),
                                    ],
                                  ),
                                  SizedBox(height: 30),
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
                  onTap: () {},
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
