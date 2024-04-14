import 'package:flutter/material.dart';
import 'package:nebuleuses/router.dart';

class Button extends StatelessWidget {
  final double height, fontSize;
  final String label;
  const Button(
      {super.key,
      required this.height,
      required this.fontSize,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.welcomeScreen);
        },
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Dongle',
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
