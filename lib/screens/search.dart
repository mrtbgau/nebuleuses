import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:nebuleuses/screens/text_container.dart';

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
                point: const LatLng(47.471136599758296, -0.6038369434940288),
                child: Image.asset('assets/images/logo.png'))
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
