import 'package:flutter/material.dart';

import '../decortaions/styles.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({super.key});

  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Fittness')),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: Decorations.bgImage1,
      ),
    );
  }
}
