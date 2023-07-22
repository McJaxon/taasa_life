import 'package:flutter/material.dart';

import '../providers/constraints.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // getLocation() async {
  //   try {} catch (e) {}
  // }

  // final Completer<GoogleMapController> _completer = Completer();
  // static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  // static const LatLng destination = LatLng(37.33429383, -122.06600055);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     body: GoogleMap(
      //   initialCameraPosition: CameraPosition(target: sourceLocation, zoom: 14.5),
      // )
      body: Center(
        child: TextButton(
            onPressed: () {
              MapUtils.openMap(1.3707, 32.3032);
            },
            child: const Text('Open Map')),
      ),
    );
  }
}
