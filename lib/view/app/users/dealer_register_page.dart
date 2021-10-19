import 'package:Estimatewale/controller/dealer/register_dealer_controller.dart';
import 'package:Estimatewale/model/radio_data_model.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/label_widget.dart';
import 'package:Estimatewale/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class DealerRegisterPage extends StatefulWidget {
  const DealerRegisterPage({Key? key}) : super(key: key);

  @override
  _DealerRegisterPageState createState() => _DealerRegisterPageState();
}

class _DealerRegisterPageState extends State<DealerRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool visibility = false;

  int brandId = 1;

  String _selectedBrand = 'ALL';

  String _selectedSpecialist = 'Iphone Repair Specialist';

  int specialistId = 1;

  String _selectedAgree = 'YES';

  int agreeId = 1;

  var filename = "";

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneController1 = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController landlineController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController fbController = TextEditingController();
  TextEditingController instaController = TextEditingController();
  TextEditingController shopyearController = TextEditingController();

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

  String imgPath = "";
  final picker = ImagePicker();

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
              decoration: BoxDecoration(
                color: white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 3,
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
                      "Retailer Sign Up",
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
                          LabelText(label: "Shop Owner Name"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            message: "Owner Name can't be empty",
                            controller: usernameController,
                            hint: "Enter Owner name",
                            inputType: TextInputType.name,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Contact Number"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            hint: "Enter Contact number",
                            message: "Contact number can't be empty",
                            controller: phoneController,
                            inputType: TextInputType.phone,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Contact Number 1"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            hint: "Enter Second Contact Number",
                            enable: true,
                            message: "Contact number 1 can't be empty",
                            controller: phoneController1,
                            inputType: TextInputType.phone,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Shop Name"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            hint: "Enter Shop name",
                            message: "Shop name can't be empty",
                            controller: shopNameController,
                            inputType: TextInputType.name,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Address"),
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
                              message: "Address can't be empty",
                              controller: addressController,
                              inputType: TextInputType.streetAddress,
                            ),
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Landline Number"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            hint: "Enter Landline number",
                            message: "Landline number can't be empty",
                            controller: landlineController,
                            inputType: TextInputType.phone,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Email Address"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            hint: "Enter Email",
                            enable: true,
                            message: "Email Address can't be empty",
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Facebook ID"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            hint: "Enter Facebook id",
                            message: "Facebook ID can't be empty",
                            controller: fbController,
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Instagram ID"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            hint: "Enter Instagram Id",
                            message: "Instagram ID can't be empty",
                            controller: instaController,
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Shop From Last How Many Years?"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            hint: "Enter Shop years",
                            message: "Shop Years can't be empty",
                            controller: shopyearController,
                            inputType: TextInputType.phone,
                          ),
                          SizedBox(height: 30),
                          SizedBox(height: 30),
                          LabelText(
                            label: "Which Mobile Brands You Can Repair?",
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: brandsList
                                .map(
                                  (e) => RadioListTile(
                                    title: LabelText(
                                      label: "${e.name}",
                                    ),
                                    groupValue: brandId,
                                    value: e.index,
                                    onChanged: (val) {
                                      setState(
                                        () {
                                          _selectedBrand = e.name;
                                          brandId = e.index;
                                        },
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: 30),
                          LabelText(
                              label:
                                  "Are You Specialist In Any Of Below Product?"),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: specialistList
                                .map(
                                  (e) => RadioListTile(
                                    title: LabelText(
                                      label: "${e.name}",
                                    ),
                                    groupValue: specialistId,
                                    value: e.index,
                                    onChanged: (val) {
                                      setState(
                                        () {
                                          _selectedSpecialist = e.name;
                                          specialistId = e.index;
                                        },
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: 30),
                          LabelText(
                              label:
                                  "YOU ARE AGREE IF WE GIVE YOUR CONTACT DETAIL TO OUR CUSTOMERS WITH THE SAME PRICE WHICH WE UPDATE ON WEBSITE?"),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: agreeList
                                .map(
                                  (e) => RadioListTile(
                                    title: LabelText(
                                      label: "${e.name}",
                                    ),
                                    groupValue: agreeId,
                                    value: e.index,
                                    onChanged: (val) {
                                      setState(
                                        () {
                                          _selectedAgree = e.name;
                                          agreeId = e.index;
                                        },
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: 30),
                          LabelText(label: "Add Photograph Of Your Shop"),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  final pickedFile = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (pickedFile != null) {
                                    setState(() {
                                      imgPath = pickedFile.path.trim();
                                      filename = path.basename(imgPath);
                                    });
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: mainColor1,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Text(
                                    "Choose File",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: width / 2,
                                  child: Text(
                                    filename,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: shadyGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          LabelText(label: "Password"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            message: "Password can't be empty",
                            controller: passwordController,
                            inputType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 20),
                          LabelText(label: "Confirm Password"),
                          SizedBox(height: 10),
                          TextFieldWidget(
                            enable: true,
                            message: "Confirm Password can't be empty",
                            controller: confirmPasswordController,
                            inputType: TextInputType.text,
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
                        registerDealer(
                          context,
                          usernameController.text,
                          emailController.text,
                          phoneController.text,
                          passwordController.text,
                          addressController.text,
                          phoneController1.text,
                          shopNameController.text,
                          landlineController.text,
                          fbController.text,
                          instaController.text,
                          shopyearController.text,
                          _selectedBrand,
                          _selectedSpecialist,
                          _selectedAgree,
                          zipcode,
                          lat,
                          lng,
                        );

                        this.setState(() {
                          usernameController.clear();
                          emailController.clear();
                          phoneController.clear();
                          phoneController1.clear();
                          shopNameController.clear();
                          landlineController.clear();
                          shopyearController.clear();
                          fbController.clear();
                          instaController.clear();
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
