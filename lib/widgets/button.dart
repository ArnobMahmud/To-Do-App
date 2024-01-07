import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const Button({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color.fromARGB(255, 227, 158, 55),
      onPressed: onPressed!,
      child: Text(
        title!,
        style: GoogleFonts.notoEmoji(
          color: const Color.fromARGB(255, 71, 24, 24),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
