import 'dart:convert';
import 'package:fix_team_app/view/app/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future registerDealer(
  BuildContext context,
  user,
  email,
  phone,
  password,
  address,
  phoneno1,
  shopname,
  landlineno,
  fbid,
  instaid,
  shopyear,
  mobilebrand,
  specialist,
  agree,
) async {
  try {
    final response = await http.post(
        Uri.parse(
          "https://estimatewale.com/application/restapi/dealerregister.php",
        ),
        body: {
          "username": user,
          "email": email,
          "contact": phone,
          "password": password,
          "address": address,
          "phoneno1": phoneno1,
          "shopname": shopname,
          "landlineno": landlineno,
          "fbid": fbid,
          "instaid": instaid,
          "shopyear": shopyear,
          "mobilebrand": mobilebrand,
          "specialist": specialist,
          "agreeprice": agree,
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
                        loginAs: 2,
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
    print("exception is : " + e.toString());
  }
}
