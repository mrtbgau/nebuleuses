import 'package:flutter/material.dart';
import 'package:nebuleuses/router.dart';
import 'package:nebuleuses/screens/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
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
