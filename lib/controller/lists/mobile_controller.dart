import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

Map<String, String> headers = {
  'content-Type': 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};

Future phoneBrand() async {
  String apiurl = "https://estimatewale.com/application/restapi/phone_list.php";
  var response = await http.get(Uri.parse(apiurl), headers: headers);

  if (response.statusCode == 200) {
  } else {
    jsonDecode("Not found any data");
    throw Exception("Failed to load brands data");
  }
}
