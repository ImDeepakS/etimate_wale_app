import 'dart:convert';

import 'package:Estimatewale/view/app/pages/my_account_page.dart';
import 'package:http/http.dart' as http;
import 'package:Estimatewale/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();
ProfileDetails profileDetails = ProfileDetails();
Future userProfile(BuildContext context, username) async {
  String apiurl =
      "https://estimatewale.com/application/restapi/single_user_details.php";
  var response = await http.post(Uri.parse(apiurl), body: {
    'username': username, //get the username text
  });
  var obj = json.decode(response.body);

  if (response.statusCode == 200) {
    profileDetails.user_name = obj["username"];
    profileDetails.phone_no = obj["contact"];
    profileDetails.e_mail = obj["email"];
    // profileDetails.zip_code = obj["zipcode"];
    profileDetails.address_txt = obj["address"];
    profileDetails.role_id = obj["role_id"];
    profileDetails.user_id = obj["id"];

    if (profileDetails.user_name != null ||
        profileDetails.phone_no != null ||
        profileDetails.e_mail != null ||
        profileDetails.address_txt != null ||
        profileDetails.user_id != null) {
      print("role id is " + profileDetails.role_id);
      print("user id is" + profileDetails.user_id);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyAccountPage(
            username: username,
            address: profileDetails.address_txt,
            phone: profileDetails.phone_no,
            email: profileDetails.e_mail,
            zipcode: profileDetails.zip_code,
            rollId: profileDetails.role_id,
            userid: profileDetails.user_id,
          ),
        ),
      );
    }
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Something wrong with database"),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
