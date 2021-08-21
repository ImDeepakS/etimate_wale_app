import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';

class StoreDetailsPage extends StatelessWidget {
  final String storeImage, storeName, storeAddress;
  const StoreDetailsPage(
      {Key? key,
      required this.storeImage,
      required this.storeName,
      required this.storeAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: dimGrey,
          ),
        ),
      ),
    );
  }
}
