import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  const ScreenTitle({super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.2,
          fontFamily: 'Dongle',
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF112A46),
        ));
  }
}
