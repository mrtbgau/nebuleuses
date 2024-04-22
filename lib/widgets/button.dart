import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double fontSize;
  final String label, route;
  final Function onTap;
  final bool isSigning;
  const Button({
    super.key,
    required this.fontSize,
    required this.label,
    required this.onTap,
    required this.route,
    required this.isSigning,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        if (!isSigning) {
          Navigator.pushNamed(context, route);
        }
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
