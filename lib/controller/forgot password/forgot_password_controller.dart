import 'dart:convert';
import 'package:fix_team_app/view/app/loginpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future forgetPassword(email, BuildContext context) async {
  try {
    final response = await http.post(
        Uri.parse(
          "https://estimatewale.com/application/restapi/forgetpassword.php",
        ),
        body: {
          "email": email,
        });
    var message = jsonDecode(json.encode(response.body));

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              TextButton(
                child: new Text("OK"),
                onPressed: () {
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) => LoginPage(),
                  //   ),
                  // );
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              TextButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  } on Exception catch (e) {
    print("exception is : " + e.toString());
  }
}
