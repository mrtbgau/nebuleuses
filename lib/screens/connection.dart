import 'package:flutter/material.dart';
import 'package:nebuleuses/screens/text_container.dart';
import 'package:nebuleuses/widgets/background_image.dart';
import 'package:nebuleuses/widgets/button.dart';
import 'package:nebuleuses/widgets/text_input.dart';
import 'package:nebuleuses/widgets/screen_title.dart';

class Connection extends StatelessWidget {
  const Connection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
          Column(children: [
            Container(
              height: 81,
              margin: const EdgeInsets.only(top: 183, bottom: 50),
              child: const Center(
                child: ScreenTitle(title: 'CONNEXION'),
              ),
            ),
            const TextContainer(
                height: 38,
                margin: 30,
                child: TextInput(placeholder: 'Mon identifiant')),
            const SizedBox(
              height: 50,
            ),
            const TextContainer(
                height: 38,
                margin: 30,
                child: TextInput(placeholder: 'Mot de passe')),
            const SizedBox(
              height: 75,
            ),
            const TextContainer(
                height: 54,
                margin: 30,
                child: Button(fontSize: 40, label: 'SE CONNECTER')),
          ]),
        ],
      ),
    );
  }
}
