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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: Decorations.bgImage1,
        child: const Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text('Fittness',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 45, 103, 129)))
          ],
        ),
      ),
    );
  }
}
