import 'dart:convert';
import 'dart:math' show cos, sqrt, asin;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<Position> getUserPosition() async {
  // Check if location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled return an error message
    return Future.error('Les services de localisation sont désactivés.');
  }

  // Check location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Les services de localisation ont été refusé.');
    }
  }

  // If permissions are granted, return the current location
  return await Geolocator.getCurrentPosition();
}

Future<String> fetchAdressWithLongAndLat(double lon, double lat) async {
  final Response response = await get(
      Uri.parse('https://api-adresse.data.gouv.fr/reverse/?lon=$lon&lat=$lat'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final adressName = data['features'][0]['properties']['name'];

    return adressName;
  } else {
    throw Exception('Erreur de chargement des données');
  }
}

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const p = 0.017453292519943295;
  final a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
