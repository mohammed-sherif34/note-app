import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key, required this.hint, required this.maxLines});
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        errorBorder: customBorderDecoration(Colors.redAccent),
        disabledBorder: customBorderDecoration(Colors.white),
        enabledBorder: customBorderDecoration(Colors.white),
        focusedBorder: customBorderDecoration(),
        border: customBorderDecoration(),
      ),
    );
  }

  OutlineInputBorder customBorderDecoration([color = Colors.blue]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color, // Set the color of the border
        width: 2.0, // Set the width of the border
      ),
      borderRadius: BorderRadius.circular(8.0), // Set the border radius
    );
  }
}
