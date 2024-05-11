import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nebuleuses/models/capsule.dart';

class DatabaseService {
  final firestore = FirebaseFirestore.instance;

  late final CollectionReference capsules;

  DatabaseService() {
    capsules = firestore.collection('capsules').withConverter<Capsule>(
        fromFirestore: (snapshots, _) => Capsule.fromJson(
              snapshots.data()!,
            ),
        toFirestore: (capsule, _) => capsule.toJson());
  }

  Stream<QuerySnapshot> getCapsules() {
    return capsules.snapshots();
  }

  void updateCapsule(String capsuleID, Capsule capsule) {
    capsules.doc(capsuleID).update(capsule.toJson());
  }
}
