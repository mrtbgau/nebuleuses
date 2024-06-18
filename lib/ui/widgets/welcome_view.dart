import 'package:flutter/material.dart';
import 'package:nebuleuses/router.dart';
import 'package:nebuleuses/ui/widgets/text_container.dart';

class WelcomeView extends StatelessWidget {
  final String image, title, description, buttonText;
  final PageController pageController;
  final int nextPage;

  const WelcomeView({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.pageController,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFF112A46),
                    fontFamily: 'HeroNew',
                    fontSize: 40,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF112A46),
                    fontFamily: 'HeroNew',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextContainer(
                height: 40,
                margin: 140,
                child: GestureDetector(
                  onTap: () {
                    if (nextPage > 0) {
                      pageController.animateToPage(
                        nextPage,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    } else {
                      Navigator.pushNamed(context, AppRouter.searchScreen);
                    }
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontFamily: 'Dongle',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
