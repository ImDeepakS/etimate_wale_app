import 'dart:convert';
import 'package:Estimatewale/view/app/loginpage.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  zipcode,
  lat,
  lng,
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
          "zipcode": zipcode,
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
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    message,
                    style: GoogleFonts.poppins(
                      color: mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              });
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
