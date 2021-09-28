// To parse this JSON data, do
//
//     final phone = phoneFromJson(jsonString);

import 'dart:convert';

Phone phoneFromJson(String str) => Phone.fromJson(json.decode(str));

String phoneToJson(Phone data) => json.encode(data.toJson());

class Phone {
  Phone({
    required this.body,
    required this.itemCount,
  });

  List<Body> body;
  int itemCount;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        itemCount: json["itemCount"],
      );

  Map<String, dynamic> toJson() => {
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
        "itemCount": itemCount,
      };
}

class Body {
  Body({
    required this.id,
    required this.mobilebrand,
  });

  String id;
  String mobilebrand;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        mobilebrand: json["mobilebrand"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mobilebrand": mobilebrand,
      };
}
