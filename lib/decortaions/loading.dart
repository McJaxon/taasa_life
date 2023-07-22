import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitHourGlass(
        color: Colors.yellow,
        size: 50.0,
        duration: Duration(seconds: 3),
      ),
    );
  }
}