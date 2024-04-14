import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

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
        body: FlutterMap(
      mapController: controller,
      options: const MapOptions(),
      children: [
        TileLayer(
          urlTemplate: 'http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
        )
      ],
    ));
  }
}
