import 'dart:convert';
import 'package:Estimatewale/view/app/homepage.dart';
import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

Future registerViaPhone(BuildContext context, user, email, phone, password,
    zipcode, address, lat, lng) async {
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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            actions: [
              Container(
                height: 70,
                child: Center(
                  child: Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
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
