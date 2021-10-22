import 'dart:convert';
import 'package:Estimatewale/view/app/homepage.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future insertQuery(BuildContext context, brand, model, problem, userid,
    dealerid, status) async {
  try {
    final response = await http.post(
        Uri.parse(
          "https://estimatewale.com/application/restapi/insert_query.php",
        ),
        body: {
          "brandid": brand,
          "modelid": model,
          "Problemid": problem,
          "userid": userid,
          "dealerid": dealerid,
          "status": status,
        });
    var message = jsonDecode(json.encode(response.body));

    if (response.statusCode == 200) {
      try {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(
                color: mainColor,
                strokeWidth: 5,
              ),
            );
          },
        );
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        });
      } on Exception catch (e) {
        throw e;
      }
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
