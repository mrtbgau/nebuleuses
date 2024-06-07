import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:nebuleuses/models/capsule.dart';
import 'package:nebuleuses/router.dart';
import 'package:nebuleuses/services/database_service.dart';
import 'package:nebuleuses/utils.dart';
import 'package:nebuleuses/widgets/background_image.dart';
import 'package:nebuleuses/widgets/screen_title.dart';
import 'package:nebuleuses/widgets/text_container.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  MapController controller = MapController();

  final DatabaseService databaseService = DatabaseService();

  double userPositionLatitude = 0;
  double userPositionLongitude = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: databaseService.getCapsules(),
            builder: (context, snapshot) {
              List capsules = snapshot.data?.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return Capsule.fromJson(data);
                  }).toList() ??
                  [];

              return FutureBuilder(
                future: getUserPosition(),
                builder:
                    (BuildContext context, AsyncSnapshot<Position> snapshot) {
                  if (snapshot.hasData) {
                    userPositionLatitude += snapshot.data!.latitude;
                    userPositionLongitude += snapshot.data!.longitude;

                    return Stack(children: [
                      FlutterMap(
                        mapController: controller,
                        options: MapOptions(
                          initialCenter: LatLng(
                              userPositionLatitude, userPositionLongitude),
                          initialZoom: 17,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'http://{s}.tile.openstreetmap.fr/openriverboatmap/{z}/{x}/{y}.png',
                          ),
                          MarkerLayer(
                              markers: capsules
                                  .map((capsule) => Marker(
                                        point: LatLng(
                                            capsule.localisation.latitude,
                                            capsule.localisation.longitude),
                                        child: GestureDetector(
                                          onTap: () {
                                            openPopUp(context, capsule);
                                          },
                                          child: SvgPicture.asset(
                                              'assets/images/marker.svg',
                                              width: 30,
                                              height: 40,
                                              color: const Color(0xFF112A46)),
                                        ),
                                      ))
                                  .toList()),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          const TextContainer(
                              height: 38,
                              margin: 45,
                              child: Text(
                                "TROUVER UNE CAPSULE",
                                style: TextStyle(
                                  fontFamily: 'Dongle',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              )),
                          Expanded(
                            child: DraggableScrollableSheet(builder:
                                (BuildContext context, scrollSheetController) {
                              return Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF112A46),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics: const ClampingScrollPhysics(),
                                      controller: scrollSheetController,
                                      itemCount: capsules.length,
                                      itemBuilder: (context, index) {
                                        Capsule capsule = capsules[index];
                                        double distance = calculateDistance(
                                          userPositionLatitude,
                                          userPositionLongitude,
                                          capsule.localisation.latitude,
                                          capsule.localisation.longitude,
                                        );
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25),
                                          child: ListTile(
                                            leading: SvgPicture.asset(
                                              'assets/images/marker.svg',
                                              width: 18,
                                              height: 24,
                                              color: const Color(0xFFACC8E5),
                                            ),
                                            title: FutureBuilder<String>(
                                              future: fetchAdressWithLongAndLat(
                                                  capsule
                                                      .localisation.longitude,
                                                  capsule
                                                      .localisation.latitude),
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
                                                    snapshot.data!,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'HeroNew',
                                                      fontSize: 18,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            trailing: Text(
                                                '${distance.toStringAsFixed(1)} km',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'HeroNew',
                                                    fontSize: 20)),
                                            onTap: () =>
                                                openPopUp(context, capsule),
                                          ),
                                        );
                                      },
                                    ),
                                  ));
                            }),
                          ),
                        ],
                      ),
                    ]);
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  // The connection state is still ongoing
                  return const Center(child: CircularProgressIndicator());
                },
              );
            }));
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
                                      context, AppRouter.unlockScreen,
                                      arguments: capsule);
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
