import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:nebuleuses/router.dart';
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
        body: Stack(children: [
      FlutterMap(
        mapController: controller,
        options: const MapOptions(
          initialCenter: LatLng(47.471127939803964, -0.6007549815877914),
          initialZoom: 17,
        ),
        children: [
          TileLayer(
            urlTemplate: 'http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
          ),
          MarkerLayer(markers: [
            Marker(
                width: 70,
                height: 70,
                point: const LatLng(47.471136599758296, -0.6038369434940288),
                child: GestureDetector(
                    onTap: () {
                      openPopUp(context);
                    },
                    child: Image.asset('assets/images/marker.png')))
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
    ]));
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
