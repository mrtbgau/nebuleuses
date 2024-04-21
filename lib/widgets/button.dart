import 'package:flutter/material.dart';
import 'package:nebuleuses/router.dart';

class Button extends StatelessWidget {
  final double fontSize;
  final String label;
  final Function onTap;
  const Button(
      {super.key,
      required this.fontSize,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
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
