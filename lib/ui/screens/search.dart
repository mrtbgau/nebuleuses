import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nebuleuses/models/capsule.dart';
import 'package:nebuleuses/models/capsule_with_distance.dart';
import 'package:nebuleuses/router.dart';
import 'package:nebuleuses/services/capsule_service.dart';
import 'package:nebuleuses/services/database_service.dart';
import 'package:nebuleuses/ui/widgets/capsule_list.dart';
import 'package:nebuleuses/ui/widgets/capsule_map.dart';
import 'package:nebuleuses/utils.dart';

import '../widgets/background_image.dart';
import '../widgets/screen_title.dart';
import '../widgets/text_container.dart';

class Search extends StatelessWidget {
  final CapsuleService _capsuleService = CapsuleService(DatabaseService());

  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Position>(
        future: getUserPosition(),
        builder: (context, positionSnapshot) {
          if (positionSnapshot.hasData) {
            return StreamBuilder<List<Capsule>>(
              stream: _capsuleService.getCapsules(),
              builder: (context, capsulesSnapshot) {
                if (capsulesSnapshot.hasData) {
                  return Stack(
                    children: [
                      CapsuleMapWidget(
                        capsules: capsulesSnapshot.data!,
                        userPosition: positionSnapshot.data!,
                        onCapsuleTap: (capsule) => openPopUp(context, capsule),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          const TextContainer(
                            height: 38,
                            margin: 45,
                            child: Text("TROUVER UNE CAPSULE", style: TextStyle(fontFamily: 'Dongle', fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white)),
                          ),
                          Expanded(
                            child: DraggableScrollableSheet(
                              builder: (context, scrollController) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF112A46),
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                                  ),
                                  child: FutureBuilder<List<CapsuleWithDistance>>(
                                    future: _capsuleService.getCapsulesSortedByDistance(),
                                    builder: (context, sortedCapsulesSnapshot) {
                                      if (sortedCapsulesSnapshot.hasData) {
                                        return CapsuleListWidget(
                                          capsules: sortedCapsulesSnapshot.data!,
                                          onCapsuleTap: (capsule) => openPopUp(context, capsule),
                                        );
                                      } else {
                                        return const Center(child: CircularProgressIndicator());
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else if (positionSnapshot.hasError) {
            return Center(child: Text('Erreur: ${positionSnapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

void openPopUp(BuildContext context, Capsule capsule) {
  showDialog(
      context: context,
      builder: ((context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(
                children: [
                  const BackgroundImage(),
                  Center(
                    child: Column(
                      children: [
                        const ScreenTitle(title: "RÉSERVER", fontSize: 64),
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
                                  color: Color(0xFF112A46),
                                  fontFamily: 'HeroNew',
                                  fontSize: 20,
                                ),
                              );
                            } else {
                              return Text(
                                "Capsule : ${snapshot.data!}",
                                style: const TextStyle(
                                  color: Color(0xFF112A46),
                                  fontFamily: 'HeroNew',
                                  fontSize: 18,
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextContainer(
                            height: 38,
                            margin: 20,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRouter.unlockScreen,
                                    arguments: capsule,
                                  );
                                },
                                child: const Text(
                                  "VALIDER",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Dongle',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ));
      }));
}
