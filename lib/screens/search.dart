import 'package:flutter/material.dart';
import 'package:nebuleuses/widgets/background_image.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [BackgroundImage()],
      ),
    );
  }
}
