import 'package:flutter/material.dart';
import 'package:taasa_life/providers/constraints.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              MapUtils.openMap(47.628293260721, -122.34263420105);
            },
            child: const Text('Open Map')),
      ),
    );
  }
}
