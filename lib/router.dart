import 'package:flutter/material.dart';
import '../ui/screens/connection.dart';
import '../ui/screens/search.dart';
import '../ui/screens/splash.dart';
import '../ui/screens/unlock.dart';
import '../ui/screens/welcome.dart';

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
    unlockScreen: (context) => Unlock()
  };
}
