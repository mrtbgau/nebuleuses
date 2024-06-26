import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nebuleuses/models/capsule.dart';
import 'package:nebuleuses/utils.dart';
import '../widgets/background_image.dart';
import '../widgets/digit_code.dart';
import '../widgets/screen_title.dart';
import '../widgets/text_container.dart';

class Unlock extends StatelessWidget {
  Unlock({super.key});

  final rdmDigit1 = Random().nextInt(10);
  final rdmDigit2 = Random().nextInt(10);
  final rdmDigit3 = Random().nextInt(10);
  final rdmDigit4 = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    final Capsule capsule =
        ModalRoute.of(context)!.settings.arguments as Capsule;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 35),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF112A46),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const ScreenTitle(
                  title: "VOTRE CODE SECRET PROVISOIRE EST :", fontSize: 48),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DigitCode(digit: rdmDigit1),
                  const SizedBox(width: 15),
                  DigitCode(digit: rdmDigit2),
                  const SizedBox(width: 15),
                  DigitCode(digit: rdmDigit3),
                  const SizedBox(width: 15),
                  DigitCode(digit: rdmDigit4),
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
              TextContainer(
                  height: 50,
                  margin: 25,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/marker.svg',
                            width: 18,
                            height: 24,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          FutureBuilder<String>(
                            future: fetchAdressWithLongAndLat(
                                capsule.localisation.longitude,
                                capsule.localisation.latitude),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text(
                                  'Chargement...',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'HeroNew',
                                    fontSize: 20,
                                  ),
                                );
                              } else {
                                return Text(
                                  "CAPSULE : ${snapshot.data!.toUpperCase()}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'HeroNew',
                                    fontSize: 18,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
