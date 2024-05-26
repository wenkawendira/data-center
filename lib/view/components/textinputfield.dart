import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "../../model/constraints.dart";

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.albertSans(
          textStyle: TextStyle(
            fontSize: 14,
            color: AppColor.kTextColor.withOpacity(0.5),
          ),
        ),
        filled: true,
        fillColor: AppColor.kOffButtonColor,
        //border around the textfield
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.kButtonColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
