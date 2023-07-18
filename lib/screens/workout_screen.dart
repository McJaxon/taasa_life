import 'package:flutter/material.dart';

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
    );
  }
}
