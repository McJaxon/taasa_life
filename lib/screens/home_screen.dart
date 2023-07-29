import 'package:flutter/material.dart';
import 'package:taasa_life/decortaions/styles.dart';

import 'myheader.dart';

class HomeScreen extends StatefulWidget {
  final String? profession;
  const HomeScreen({this.profession, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.list,
                        size: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 260,
                  ),
                  const SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 110, 104, 104),
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/plus.png'),
                    ),
                  )
                ],
              ),
            ),
            Drawer(
              child: ListView(children: [MyHeader()]),
            )
          ],
        ),
      ),
    );
  }
}
