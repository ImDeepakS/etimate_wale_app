import 'dart:convert';
import 'package:fix_team_app/view/app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

Future login(BuildContext context, username, password) async {
  String apiurl = "https://estimatewale.com/application/restapi/login.php";
  var response = await http.post(Uri.parse(apiurl), body: {
    'username': username, //get the username text
    'password': password, //get password text
  });
  var message = json.decode(response.body);

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
                if (message == "Login Successful") {
                  print("message");

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );

                  storeTokenAndData(username, password);
                } else {
                  print("error message");
                  Navigator.pop(context);
                }
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
}

void storeTokenAndData(username, password) async {
  print("storing token and data");
  await storage.write(key: "token", value: username.toString());
  await storage.write(key: "usercredential", value: password.toString());
}

Future<String?> getToken() async {
  return await storage.read(key: "token");
}
