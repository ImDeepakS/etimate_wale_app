import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFile extends StatefulWidget {
  const SearchFile({Key? key}) : super(key: key);

  @override
  _SearchFileState createState() => _SearchFileState();
}

class _SearchFileState extends State<SearchFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search your model",
            hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: dimGrey,
            ),
          ),
        ),
        leading: Icon(
          Icons.search,
          color: dimGrey,
        ),
      ),
    );
  }
}
