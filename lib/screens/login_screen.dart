import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taasa_life/decortaions/styles.dart';

class LogInScreen extends StatefulWidget {
  final VoidCallback switchUser;
  const LogInScreen({super.key, required this.switchUser});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool bookMarked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: Decorations.bgDecoration,
          child: ListView(
            children: [
              const SizedBox(
                height: 250,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: Text(
                      'Taasa Life',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                        child: Text(
                      'Please Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 70,
                child: GestureDetector(
                  child: Lottie.network(
                      'https://assets3.lottiefiles.com/packages/lf20_T9jCikauOc.json',
                      controller: _controller),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                  child: Column(
                children: [
                  SizedBox(
                      child: TextFormField(
                    decoration: Decorations.decoration
                        .copyWith(label: const Text('Email/phone')),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      child: TextFormField(
                    decoration: Decorations.decoration
                        .copyWith(label: const Text('Password')),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: ElevatedButton(
                        onPressed: () {
                          if (bookMarked == false) {
                            bookMarked = true;
                            _controller.forward();
                          } else {
                            bookMarked = false;
                            _controller.reverse();
                          }
                        },
                        child: const Text('LogIn')),
                  ),
                ],
              )),
              const SizedBox(
                height: 120,
              ),
              Container(
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  children: [
                    const SizedBox(
                      child: Text(' Should Create Account'),
                    ),
                    SizedBox(
                      child: TextButton(
                          onPressed: widget.switchUser,
                          child: const Text('SignUp')),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
