import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double fontSize;
  final String label;
  final Function onTap;
  final GlobalKey<FormState> formKey;
  const Button(
      {super.key,
      required this.fontSize,
      required this.label,
      required this.onTap,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          onTap();
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
