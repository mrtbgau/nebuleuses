import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nebuleuses/router.dart';
import '../widgets/background_image.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRouter.connectionScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
          Center(
            child: SizedBox(
              width: 269,
              height: 312,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ), // Replace with your image
            ),
          ),
        ],
      ),
    );
  }
}
