import 'package:fix_team_app/view/app/forms/estimate_price.dart';
import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    Key? key,
    required this.width,
    required this.height,
    required this.header,
  }) : super(key: key);

  final double width;
  final double height;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 240,
        left: 15,
        right: 20,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EstimatePricePage(),
            ),
          );
        },
        child: Container(
          width: width / 1.1,
          height: height / 4,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: black.withOpacity(0.4),
                offset: Offset(0.5, 0.5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 40),
            child: Text(
              header,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
