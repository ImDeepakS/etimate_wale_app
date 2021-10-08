import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  final String label;
  const LabelText({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.poppins(
        color: shadyGrey,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class SecondLabel extends StatelessWidget {
  final String label;
  const SecondLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.poppins(
        color: dimGrey,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class ThirdLabel extends StatelessWidget {
  final String label;
  const ThirdLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: dimGrey,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class TermsText extends StatelessWidget {
  final String txt;
  const TermsText({
    Key? key,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.poppins(
        color: black.withOpacity(0.4),
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
        wordSpacing: 1,
      ),
    );
  }
}
