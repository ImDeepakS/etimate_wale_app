import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

Map<String, String> headers = {
  'content-Type': 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};
