import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      autocorrect: true,
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 5, 23, 81),
        fontSize: 20,
      ),
      maxLines: maxLines!,
      minLines: minLines!,
      controller: controller!,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
            width: 2,
            color: Color.fromARGB(255, 60, 44, 49),
          ),
        ),
        hintText: hintText!,
        hintStyle: GoogleFonts.lato(
          color: const Color.fromARGB(255, 71, 24, 24),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
