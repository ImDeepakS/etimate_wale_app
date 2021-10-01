// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;

// final storage = new FlutterSecureStorage();

// Future singleBrand(BuildContext context, String brandId) async {
//   String apiurl =
//       "https://estimatewale.com/application/restapi/single_brand.php";
//   var response = await http.post(Uri.parse(apiurl), body: {
//     'id': brandId,
//   });
//   var message = json.decode(response.body);

//   if (response.statusCode == 200) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: new Text("message"),
//           actions: <Widget>[
//             TextButton(
//               child: new Text("OK"),
//               onPressed: () {
//                 print("message received from single data is $message");
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
// }
