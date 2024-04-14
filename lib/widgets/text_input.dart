import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String placeholder;
  const TextInput({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration.collapsed(
        border: InputBorder.none,
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontFamily: "Dongle",
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
