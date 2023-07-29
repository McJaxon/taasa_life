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
        padding: const EdgeInsets.fromLTRB(0, 50, 10, 10),
        decoration: Decorations.bgImage1,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 550,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 250, 241, 164),
                    Color.fromARGB(255, 192, 225, 252),
                  ])),
              child: const Center(
                child: Text('Fittness',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 45, 103, 129))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
