import 'dart:convert';
import 'package:fix_team_app/view/app/forms/generated_queris.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future updatePrice(
    BuildContext context, updateprice, brand, model, problem, userid) async {
  try {
    final response = await http.post(
        Uri.parse(
          "https://estimatewale.com/application/restapi/update_query_price.php",
        ),
        body: {
          "updateprice": updateprice,
          "brand": brand,
          "model": model,
          "problem": problem,
          "user_id": userid,
        });
    var message = jsonDecode(json.encode(response.body));

    if (response.statusCode == 200) {
      if (message == "price updated successfully") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(message),
              actions: <Widget>[
                TextButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
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
