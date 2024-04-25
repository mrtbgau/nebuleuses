import 'package:flutter/material.dart';
import 'package:nebuleuses/router.dart';
import 'package:nebuleuses/widgets/background_image.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(fit: StackFit.expand, children: [
          const BackgroundImage(),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 50),
                margin: const EdgeInsets.only(top: 50),
                child: const Text(
                  textAlign: TextAlign.left,
                  'Bienvenue',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 40,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  'Quis laborum in eu non esse qui id sit cupidatat velit anim ea. Ex nostrud sit esse incididunt et fugiat fugiat dolore. Voluptate deserunt eu quis irure. Reprehenderit est cupidatat consectetur aute irure. Ut ullamco nostrud nulla proident labore. Dolor occaecat deserunt officia aliquip in irure ea sint enim deserunt ipsum velit. In minim laborum in minim.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF112A46),
                    shape: const CircleBorder(),
                    fixedSize: const Size(125, 125)),
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.searchScreen);
                },
                child: const Text(
                  "GO",
                  style: TextStyle(
                    fontFamily: "Dongle",
                    fontSize: 80,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}
