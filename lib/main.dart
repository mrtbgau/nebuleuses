import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nebuleuses/router.dart';
import 'package:nebuleuses/screens/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // to delete if useless

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: dotenv.env["FIREBASE_API_KEY"].toString(),
          appId: "1:285988176987:android:7d68c2434977e571f8eb7e",
          messagingSenderId: "285988176987",
          projectId: "nebuleuses-618a5"));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRouter.routes,
      home: const Splash(),
    );
  }
}
