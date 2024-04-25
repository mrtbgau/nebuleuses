import 'package:flutter/material.dart';

class DigitCode extends StatelessWidget {
  final int digit;
  const DigitCode({super.key, required this.digit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF112A46),
      ),
      child: Text(
        textAlign: TextAlign.center,
        digit.toString(),
        style: const TextStyle(
          fontFamily: "Dongle",
          fontSize: 60,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
