import 'package:fix_team_app/view/app/loginpage.dart';
import 'package:fix_team_app/view/app/users/dealer_register_page.dart';
import 'package:fix_team_app/view/app/users/estimate_price.dart';
import 'package:fix_team_app/view/app/users/user_register_page.dart';
import 'package:fix_team_app/view/widgets/tile_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 55,
              width: 30,
              decoration: BoxDecoration(color: Colors.black),
            ),
            TileWidget(title: "User Register", page: UserRegisterPage()),
            SizedBox(height: 1),
            TileWidget(title: "Dealer Register", page: DealerRegisterPage()),
            SizedBox(height: 1),
            TileWidget(title: "LogIn", page: LoginPage()),
            SizedBox(height: 1),
            TileWidget(title: "Estimate the price", page: EstimatePricePage()),
            SizedBox(height: 1),
          ],
        ),
      ),
    );
  }
}
