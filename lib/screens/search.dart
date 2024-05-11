import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:nebuleuses/router.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getUserPosition(),
      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        if (snapshot.hasData) {
          return Stack(children: [
            FlutterMap(
              mapController: controller,
              options: MapOptions(
                initialCenter:
                    LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                initialZoom: 17,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'http://{s}.tile.openstreetmap.fr/openriverboatmap/{z}/{x}/{y}.png',
                ),
                MarkerLayer(markers: [
                  Marker(
                      width: 70,
                      height: 70,
                      point: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/images/marker.png'),
                            const Text(
                              textAlign: TextAlign.center,
                              'Vous',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "HeroNew"),
                            ),
                          ],
                        ),
                      )),
                  Marker(
                      point: const LatLng(47.47194, -0.54628),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.46534, -0.55095),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.46502, -0.55297),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.465, -0.55801),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.46949, -0.54503),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.47091, -0.55184),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.47187, -0.55734),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.48015, -0.5507),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.47992, -0.54006),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.46995, -0.56926),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.47452, -0.56234),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                  Marker(
                      point: const LatLng(47.4929, -0.56651),
                      child: GestureDetector(
                        onTap: () {
                          openPopUp(context);
                        },
                        child: Image.asset('assets/images/marker.png'),
                      )),
                ])
              ],
            ),
            const Column(
              children: [
                SizedBox(height: 50),
                TextContainer(
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
                    ))
              ],
            ),
          ]);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // The connection state is still ongoing
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}

void openPopUp(BuildContext context) {
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
                //alignment: Alignment.center,
                children: [
                  const BackgroundImage(),
                  Column(
                    children: [
                      const ScreenTitle(title: "RÉSERVER", fontSize: 64),
                      const Text("CAPSULE 1 : RUE ABCDEFG",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'HeroNew',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF112A46),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      TextContainer(
                          height: 38,
                          margin: 20,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRouter.unlockScreen);
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
                  )
                ],
              ),
            ));
      }));
}
