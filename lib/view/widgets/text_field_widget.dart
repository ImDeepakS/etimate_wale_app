import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? message;
  final maxline;
  final String? hint;
  final TextInputType? inputType;
  const TextFieldWidget(
      {Key? key,
      this.controller,
      this.message,
      this.inputType,
      this.hint,
      this.maxline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(
        hintText: hint,
        isDense: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
      ],
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade600,
        letterSpacing: 2,
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return message;
        }
        return null;
      },
      controller: controller,
      keyboardType: inputType,
      maxLines: maxline,
    );
  }
}
