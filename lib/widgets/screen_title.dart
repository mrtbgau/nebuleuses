import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String title;
  const ScreenTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
          fontFamily: 'Dongle',
          fontSize: 64,
          fontWeight: FontWeight.w700,
          color: Color(0xFF112A46),
        ));
  }
}
