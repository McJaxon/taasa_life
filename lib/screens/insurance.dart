import 'package:flutter/material.dart';

import '../decortaions/styles.dart';
import '../widgets/insurance_row.dart';
import '../widgets/medical_row.dart';
import 'main_screen.dart';

class InsuranceScreen extends StatefulWidget {
  const InsuranceScreen({super.key});

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: Decorations.bgDecoration,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        label: const Text('Back')),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const SizedBox(
                    child: Text('Health Assists'),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                child: Row(
                    children: assistList
                        .map((assits) => InsuranceRow(
                              assistList: assits,
                            ))
                        .toList()),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Row(
                  children: assistsList
                      .map((assit) => MedicalRow(
                            assistList: assit,
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 45, 103, 129),
                    foregroundColor: Colors.white),
                onPressed: () {
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
                            return const MainScreen();
                          }));
                },
                label: const Text('Skip'),
                icon: const Icon(Icons.navigate_next_sharp),
              )
            ],
          )),
    );
  }
}
