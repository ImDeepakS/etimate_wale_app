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
