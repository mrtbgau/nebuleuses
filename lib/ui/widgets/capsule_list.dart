import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nebuleuses/models/capsule.dart';
import 'package:nebuleuses/models/capsule_with_distance.dart';
import 'package:nebuleuses/utils.dart';


class CapsuleListWidget extends StatelessWidget {
  final List<CapsuleWithDistance> capsules;
  final Function(Capsule) onCapsuleTap;

  const CapsuleListWidget({
    super.key,
    required this.capsules,
    required this.onCapsuleTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: capsules.length,
      itemBuilder: (context, index) {
        final capsuleWithDistance = capsules[index];
        return ListTile(
          leading: SvgPicture.asset('assets/images/marker.svg', width: 18, height: 24, color: const Color(0xFFACC8E5)),
          title: FutureBuilder<String>(
            future: fetchAdressWithLongAndLat(
              capsuleWithDistance.capsule.localisation.longitude,
              capsuleWithDistance.capsule.localisation.latitude
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Chargement...', style: TextStyle(color: Colors.white, fontFamily: 'HeroNew', fontSize: 20));
              } else {
                return Text(snapshot.data!, style: const TextStyle(color: Colors.white, fontFamily: 'HeroNew', fontSize: 18));
              }
            },
          ),
          trailing: Text('${capsuleWithDistance.distance.toStringAsFixed(1)} km', 
                         style: const TextStyle(color: Colors.white, fontFamily: 'HeroNew', fontSize: 20)),
          onTap: () => onCapsuleTap(capsuleWithDistance.capsule),
        );
      },
    );
  }
}