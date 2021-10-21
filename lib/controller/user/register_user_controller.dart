import 'dart:convert';
import 'package:Estimatewale/view/app/loginpage.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future registerUser(BuildContext context, user, email, phone, password, zipcode,
    address, lat, lng) async {
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
          "lat": lat,
          "lng": lng,
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
              builder: (context) => LoginPage(),
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
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            actions: [
              Center(
                child: Text(message),
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
