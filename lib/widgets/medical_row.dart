import 'package:flutter/material.dart';
import 'package:taasa_life/screens/nextkin_screen.dart';

import '../decortaions/styles.dart';
import '../screens/medical_screen.dart';

class MedicalRow extends StatefulWidget {
  final Map<String, dynamic> assistList;
  const MedicalRow({super.key, required this.assistList});

  @override
  State<MedicalRow> createState() => _MedicalRowState();
}

class _MedicalRowState extends State<MedicalRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.assistList['title1'] == 'Next of Kin') {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder:
                      (context, animation, animationTime, child) {
                    return ScaleTransition(
                        scale: animation,
                        alignment: Alignment.center,
                        child: child);
                  },
                  pageBuilder: (context, animation, animationTime) {
                    return const NextKinScreen();
                  }));
        } else {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder:
                      (context, animation, animationTime, child) {
                    return ScaleTransition(
                        scale: animation,
                        alignment: Alignment.center,
                        child: child);
                  },
                  pageBuilder: (context, animation, animationTime) {
                    return const MedicalScreen();
                  }));
        }
      },
      child: Container(
        width: AppLayout.getWidth(180),
        height: AppLayout.getHeight(200),
        decoration: BoxDecoration(
            border: Border.all(
                width: AppLayout.getHeight(15),
                color: const Color.fromARGB(255, 45, 103, 129)),
            boxShadow: const [
              BoxShadow(color: Colors.red, blurRadius: 2, spreadRadius: 1)
            ],
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 45, 103, 129)),
        margin: EdgeInsets.only(left: AppLayout.getHeight(15)),
        child: Column(
          children: [
            // Container(child: ListView(children: [SizedBox(height: 150, child: ,)],),),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/${widget.assistList['picture1']}',
                      ))),
            ),
            Text(widget.assistList['title1']),
          ],
        ),
      ),
    );
  }
}
