import 'package:cloud_firestore/cloud_firestore.dart';

class Capsule {
  late int? code;
  final bool estDisponible;
  final GeoPoint localisation;

  Capsule({this.code, required this.estDisponible, required this.localisation});

  Capsule.fromJson(Map<String, Object?> json)
      : this(
          code: json['code'] as int?,
          estDisponible: json['estDisponible']! as bool,
          localisation: json['localisation']! as GeoPoint,
        );

  Map<String, Object?> toJson() {
    return {
      'code': code,
      'estDisponible': estDisponible,
      'localisation': localisation,
    };
  }
}
