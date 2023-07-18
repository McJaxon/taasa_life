import 'package:flutter/material.dart';
import 'package:taasa_life/decortaions/styles.dart';

import '../screens/bank_screen.dart';
import '../screens/insure_screen.dart';

class InsuranceRow extends StatefulWidget {
  final Map<String, dynamic> assistList;
  const InsuranceRow({super.key, required this.assistList});

  @override
  State<InsuranceRow> createState() => _InsuranceRowState();
}

class _InsuranceRowState extends State<InsuranceRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.assistList['picture'] == 'Insurance details') {
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
                    return const InsureScreen();
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
                    return const BankScreen();
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
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/${widget.assistList['picture']}',
                        ))),
              ),
              Text(widget.assistList['title'])
            ],
          ),
        ),
      ),
    );
  }
}
