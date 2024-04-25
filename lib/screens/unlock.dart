import 'package:flutter/material.dart';
import 'package:nebuleuses/widgets/background_image.dart';
import 'package:nebuleuses/widgets/digit_code.dart';
import 'package:nebuleuses/widgets/screen_title.dart';
import 'package:nebuleuses/widgets/text_container.dart';

class Unlock extends StatelessWidget {
  const Unlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const ScreenTitle(
                  title: "VOTRE CODE SECRET PROVISOIRE EST :", fontSize: 48),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DigitCode(digit: 1),
                  SizedBox(width: 15),
                  DigitCode(digit: 3),
                  SizedBox(width: 15),
                  DigitCode(digit: 7),
                  SizedBox(width: 15),
                  DigitCode(digit: 5),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  textAlign: TextAlign.justify,
                  "Vous êtes le seul détenteur de ce code.\nPour des raisons de sécurité, celui-ci est confidentiel.\nIl expirera lorsque vous quitterez la capsule.",
                  style: TextStyle(
                      fontFamily: 'HeroNew',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF112A46)),
                ),
              ),
              const SizedBox(height: 50),
              const ScreenTitle(title: "VOUS AVEZ RÉSERVÉ :", fontSize: 40),
              const SizedBox(height: 15),
              const TextContainer(
                  height: 50,
                  margin: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          width: 17,
                          height: 24,
                          image: AssetImage("assets/images/marker_white.png")),
                      SizedBox(width: 15),
                      Text(
                        "CAPSULE 1 : RUE ABCDEFG",
                        style: TextStyle(
                            fontFamily: "HeroNew",
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
