import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final Widget child;
  final double margin, height;
  const TextContainer(
      {super.key,
      required this.height,
      required this.margin,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        color: const Color(0xFF112A46),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Align(
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
