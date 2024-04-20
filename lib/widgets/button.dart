import 'package:flutter/material.dart';
import 'package:nebuleuses/router.dart';

class Button extends StatelessWidget {
  final double fontSize;
  final String label;
  const Button({super.key, required this.fontSize, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.welcomeScreen);
      },
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Dongle',
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
