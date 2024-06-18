import 'package:flutter/material.dart';
import 'package:nebuleuses/ui/widgets/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/background_image.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  static final PageController pageController = PageController(initialPage: 0);

  List<Widget> welcomeViews = [
    WelcomeView(
      image: "assets/images/logo.png",
      title: "Bienvenue",
      description:
          "Nébuleuses est là pour vous offrir un abri temporaire et confortable lorsque vous en avez besoin.",
      buttonText: "Suivant",
      pageController: pageController,
      nextPage: 1,
    ),
    WelcomeView(
      image: "assets/images/carte.png",
      title: "Réservation",
      description:
          "Choisissez un emplacement et une date pour réserver votre capsule.",
      buttonText: "Suivant",
      pageController: pageController,
      nextPage: 2,
    ),
    WelcomeView(
      image: "assets/images/code.png",
      title: "Code d'accès",
      description:
          "Recevez votre code d'accès unique pour entrer dans la capsule",
      buttonText: "Suivant",
      pageController: pageController,
      nextPage: 3,
    ),
    WelcomeView(
      image: "assets/images/logo.png",
      title: "Services",
      description:
          "Profitez de prises électriques, du Wi-Fi et de l'alimentation solaire dans chaque capsule.",
      buttonText: "GO",
      pageController: pageController,
      nextPage: -1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(fit: StackFit.expand, children: [
        const BackgroundImage(),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: welcomeViews,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SmoothPageIndicator(
                controller: pageController,
                count: welcomeViews.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xFF112A46),
                  dotColor: Color(0xFFD1D1D1),
                ),
                onDotClicked: (index) {
                  pageController.animateToPage(
                    index,
                    duration: Durations.long1,
                    curve: Curves.linear,
                  );
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
