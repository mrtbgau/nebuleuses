import 'package:nebuleuses/models/capsule.dart';
import 'package:nebuleuses/models/capsule_with_distance.dart';
import 'package:nebuleuses/services/database_service.dart';
import 'package:nebuleuses/utils.dart';

class CapsuleService {
  final DatabaseService _databaseService;

  CapsuleService(this._databaseService);

  Stream<List<Capsule>> getCapsules() {
    return _databaseService.getCapsules().map((snapshot) => 
      snapshot.docs.map((doc) => Capsule.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }

  Future<List<CapsuleWithDistance>> getCapsulesSortedByDistance() async {
    final userPosition = await getUserPosition();
    final capsules = await getCapsules().first;
    return capsules.map((capsule) {
      final distance = calculateDistance(
        userPosition.latitude, userPosition.longitude,
        capsule.localisation.latitude, capsule.localisation.longitude
      );
      return CapsuleWithDistance(capsule, distance);
    }).toList()
      ..sort((a, b) => a.distance.compareTo(b.distance));
  }
}