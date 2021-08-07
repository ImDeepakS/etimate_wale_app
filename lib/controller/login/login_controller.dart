import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future login(BuildContext context, user, password) async {
  // try {
  //   final response = await http.post(
  //       Uri.parse(
  //         "https://flymediatech.in/location/application/restapi/login.php",
  //       ),
  //       body: {
  //         "username": user,
  //         "password": password,
  //       });
  //   var message = jsonDecode(json.encode(response.body));

  //   if (response.statusCode == 200) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: new Text(message),
  //           actions: <Widget>[
  //             TextButton(
  //               child: new Text("OK"),
  //               onPressed: () {
  //                 Navigator.of(context).pushReplacement(
  //                   MaterialPageRoute(
  //                     builder: (context) => HomePage(),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: new Text(message),
  //           actions: <Widget>[
  //             TextButton(
  //               child: new Text("OK"),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // } on Exception catch (e) {
  //   print("exception is " + e.toString());
  // }
  try {
    var url = Uri.parse(
        "https://flymediatech.in/location/application/restapi/login.php");

    var response = await http.post(url, body: {
      "username": user,
      "password": password,
    });

    var message = jsonDecode(response.body);

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
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  } on Exception catch (e) {
    print("Exceptions " + e.toString());
  }
}
