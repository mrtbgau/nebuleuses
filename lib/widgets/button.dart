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
    return Container(
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          color: const Color(0xFF112A46),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
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
        ));
  }
}
