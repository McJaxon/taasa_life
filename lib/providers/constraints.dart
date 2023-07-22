import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();
  static Future<void> openMap(double latitude, double longitude) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could\'nt load map';
    }
  }
}

// const String google_api_key = "AIzaSyAd4rEAQqfCJGABqW99teDP9BcuyN08";
const Color primaryColor = Color.fromARGB(255, 45, 103, 129);
const double defaultPadding = 10;
