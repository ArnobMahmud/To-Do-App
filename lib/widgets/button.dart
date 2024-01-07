import 'package:flutter/material.dart';

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
      color:const Color.fromARGB(255, 202, 227, 55),
      onPressed: onPressed!,
      child: Text(title!),
    );
  }
}
