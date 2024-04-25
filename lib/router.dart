import 'package:flutter/material.dart';
import 'package:nebuleuses/screens/connection.dart';
import 'package:nebuleuses/screens/search.dart';
import 'package:nebuleuses/screens/splash.dart';
import 'package:nebuleuses/screens/unlock.dart';
import 'package:nebuleuses/screens/welcome.dart';

class AppRouter {
  static const String splashScreen = "/splash";
  static const String connectionScreen = "/connection";
  static const String welcomeScreen = "/welcome";
  static const String searchScreen = "/search";
  static const String unlockScreen = "/unlock";

  static final routes = <String, Widget Function(BuildContext)>{
    splashScreen: (context) => const Splash(),
    connectionScreen: (context) => const Connection(),
    welcomeScreen: (context) => const Welcome(),
    searchScreen: (context) => const Search(),
    unlockScreen: (context) => const Unlock()
  };
}
