import 'package:fix_team_app/view/app/homepage.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
