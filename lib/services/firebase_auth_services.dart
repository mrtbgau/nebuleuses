import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signIn(String username, String pwd) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: username, password: pwd);
      return userCredential.user;
    } catch (e) {
      log("error");
    }

    return null;
  }
}
