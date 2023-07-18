import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taasa_life/screens/insurance.dart';

import '../decortaions/styles.dart';

class InsureScreen extends StatefulWidget {
  const InsureScreen({super.key});

  @override
  State<InsureScreen> createState() => _InsureScreenState();
}

class _InsureScreenState extends State<InsureScreen> {
  DateTime _dateTime = DateTime(2015, 2, 1, 10, 20);
  bool? _checkBox = false;
  bool? _checkBox2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Center(
      //     child: Text('Profile'),
      //   ),
      // ),
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
                    width: 100,
                  ),
                  const SizedBox(
                    child: Text('Profile'),
                  )
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              Form(
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pro.png'),
                      radius: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        child: TextFormField(
                      decoration: Decorations.decoration
                          .copyWith(label: const Text('Names')),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 45, 103, 129),
                            foregroundColor: Colors.white),
                        child: const Text('Date of birth'),
                        onPressed: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) => SizedBox(
                                    height: 250,
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,
                                      initialDateTime: _dateTime,
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() {
                                          _dateTime = newTime;
                                        });
                                      },
                                      use24hFormat: true,
                                      mode: CupertinoDatePickerMode.date,
                                    ),
                                  ));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        child: TextFormField(
                      decoration: Decorations.decoration
                          .copyWith(label: const Text('Location')),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              child: Text('Male'),
                            ),
                            SizedBox(
                              child: Checkbox(
                                  activeColor: Colors.white,
                                  side: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 45, 103, 129),
                                    strokeAlign: 2,
                                  ),
                                  checkColor:
                                      const Color.fromARGB(255, 45, 103, 129),
                                  value: _checkBox,
                                  onChanged: (val) {
                                    setState(() {
                                      _checkBox = val;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              child: Text('Female'),
                            ),
                            SizedBox(
                              child: Checkbox(
                                  activeColor: Colors.white,
                                  side: const BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 45, 103, 129),
                                    strokeAlign: 2,
                                  ),
                                  checkColor:
                                      const Color.fromARGB(255, 45, 103, 129),
                                  value: _checkBox2,
                                  onChanged: (val2) {
                                    setState(() {
                                      _checkBox2 = val2;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        child: TextFormField(
                      decoration: Decorations.decoration
                          .copyWith(label: const Text('Phone Number')),
                    )),
                    const SizedBox(
                      height: 70,
                    ),
                    SizedBox(
                      width: 130,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 45, 103, 129),
                            foregroundColor: Colors.white),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  transitionsBuilder: (context, animation,
                                      animationTime, child) {
                                    return ScaleTransition(
                                        scale: animation,
                                        alignment: Alignment.center,
                                        child: child);
                                  },
                                  pageBuilder:
                                      (context, animation, animationTime) {
                                    return const InsuranceScreen();
                                  }));
                        },
                        child: const Row(
                          children: [
                            Text('Continue'),
                            Icon(Icons.navigate_next_sharp)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
