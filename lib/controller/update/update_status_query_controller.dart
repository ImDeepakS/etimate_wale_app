import 'dart:convert';
import 'package:Estimatewale/view/app/forms/accepted_queries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future updateQueryStatus(BuildContext context, brandid, modelid, problemid,
    userid, dealerid, status) async {
  try {
    final response = await http.post(
        Uri.parse(
          "https://estimatewale.com/application/restapi/update_query_status.php",
        ),
        body: {
          "brandid": brandid,
          "modelid": modelid,
          "Problemid": problemid,
          "userid": userid,
          "dealerid": dealerid,
          "status": status,
        });
    var message = jsonDecode(json.encode(response.body));

    if (response.statusCode == 200) {
      if (message == "Query Accepted") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(message),
              actions: <Widget>[
                TextButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AcceptedQueriesList(
                          userID: userid,
                        ),
                      ),
                    );
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
