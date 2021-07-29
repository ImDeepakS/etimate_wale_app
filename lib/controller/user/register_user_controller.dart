import 'dart:convert';

import 'package:fix_team_app/model/user_register_model.dart';
import 'package:http/http.dart' as http;

Future<User> createUser(
    String username, email, phone, password, zipcode, address) async {
  final response = await http.post(
    Uri.parse('https://fix-team.herokuapp.com/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'zipcode': zipcode,
      'address': address,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("User created successfully");

    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
