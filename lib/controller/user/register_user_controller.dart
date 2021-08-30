import 'dart:convert';
import 'package:fix_team_app/view/app/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future registerUser(BuildContext context, user, email, phone, password, zipcode,
    address) async {
  try {
    final response = await http.post(
        Uri.parse(
          "https://estimatewale.com/application/restapi/userregister.php",
        ),
        body: {
          "username": user,
          "email": email,
          "contact": phone,
          "password": password,
          "zipcode": zipcode,
          "address": address,
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        loginAs: 1,
                      ),
                    ),
                  );
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
    print("Exception is: " + e.toString());
  }
}
