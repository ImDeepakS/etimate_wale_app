import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? message;
  final maxline;
  final String? hint;
  final bool enable;
  final TextInputType? inputType;
  const TextFieldWidget(
      {Key? key,
      required this.enable,
      this.controller,
      this.message,
      this.inputType,
      this.hint,
      this.maxline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0.5, 0.5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        style: GoogleFonts.poppins(
          color: shadyGrey,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        decoration: new InputDecoration(
          hintText: hint,
          isDense: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          enabled: enable,
          hintStyle: GoogleFonts.poppins(
            color: shadyGrey,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(30),
        ],
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return message;
          }
          return null;
        },
      ),
    );
  }
}

class PasswordFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? message;
  final maxline;
  final bool? securetext;
  final String? hint;
  final TextInputType? inputType;
  const PasswordFieldWidget(
      {Key? key,
      this.controller,
      this.securetext,
      this.message,
      this.inputType,
      this.hint,
      this.maxline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0.5, 0.5),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: securetext!,
        controller: controller,
        keyboardType: inputType,
        style: GoogleFonts.poppins(
          color: shadyGrey,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        decoration: new InputDecoration(
          hintText: hint,
          isDense: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(
            color: shadyGrey,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(30),
        ],
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return message;
          }
          return null;
        },
      ),
    );
  }
}
