import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final Widget child;
  const TextContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 45),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: const Color(0xFF112A46),
        borderRadius: BorderRadius.circular(50),
      ),
      child: child,
    );
  }
}
