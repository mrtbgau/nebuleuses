import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:nebuleuses/models/capsule.dart';


class CapsuleMapWidget extends StatelessWidget {
  final List<Capsule> capsules;
  final Position userPosition;
  final Function(Capsule) onCapsuleTap;

  const CapsuleMapWidget({
    super.key,
    required this.capsules,
    required this.userPosition,
    required this.onCapsuleTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(userPosition.latitude, userPosition.longitude),
        initialZoom: 17,
      ),
      children: [
        TileLayer(
          urlTemplate: 'http://{s}.tile.openstreetmap.fr/openriverboatmap/{z}/{x}/{y}.png',
        ),
        MarkerLayer(
          markers: capsules.map((capsule) => Marker(
            point: LatLng(capsule.localisation.latitude, capsule.localisation.longitude),
            child: GestureDetector(
              onTap: () => onCapsuleTap(capsule),
              child: SvgPicture.asset('assets/images/marker.svg', width: 30, height: 40, color: const Color(0xFF112A46)),
            ),
          )).toList(),
        ),
      ],
    );
  }
}