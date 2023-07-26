import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taasa_life/authentications/firebase_auth.dart';
import 'package:taasa_life/decortaions/loading.dart';
import 'package:taasa_life/decortaions/styles.dart';

import 'profile_screen.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback switchUser;
  const SignUpScreen({super.key, required this.switchUser});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool _loading = false;
  bool bookMarked = false;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthentication accessFirebase = FirebaseAuthentication();
    return _loading
        ? const Loading()
        : Scaffold(
            body: Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: Decorations.bgDecoration,
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.keyboard_backspace_rounded,
                          size: 30,
                        ),
                        label: const Text(''),
                      ),
                    ),
                    const SizedBox(
                      height: 210,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              child: Text(
                            'Welcome ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                              child: Text(
                            'Taasa Life',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
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
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                              child: TextFormField(
                            controller: emailController,
                            decoration: Decorations.decoration
                                .copyWith(label: const Text('Email/phone')),
                            validator: (value) =>
                                value!.isEmpty ? 'Please provide Email' : null,
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: Decorations.decoration
                                .copyWith(label: const Text('Create Password')),
                            validator: (value) =>
                                value!.length <= 7 ? 'Invalid Password' : null,
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              child: TextFormField(
                            obscureText: true,
                            controller: confirmPasswordController,
                            decoration: Decorations.decoration.copyWith(
                                label: const Text('Confirm Password')),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _loading = true;
                                  });
                                  if (bookMarked == false) {
                                    bookMarked = true;
                                    _controller.forward();
                                    accessFirebase
                                        .createEmailAccount(
                                            emailController.text,
                                            passwordController.text)
                                        .then((value) => Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                                transitionDuration:
                                                    const Duration(
                                                        milliseconds: 500),
                                                transitionsBuilder: (context,
                                                    animation,
                                                    animationTime,
                                                    child) {
                                                  return ScaleTransition(
                                                      scale: animation,
                                                      alignment:
                                                          Alignment.center,
                                                      child: child);
                                                },
                                                pageBuilder: (context,
                                                    animation, animationTime) {
                                                  return const ProfileScreen();
                                                })));
                                  } else {
                                    bookMarked = false;
                                    _controller.reverse();
                                  }
                                }
                              },
                              child: const Text('Sign Up')),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 90),
                    //   child: Row(
                    //     children: [
                    //       const SizedBox(
                    //         child: Text('Already Have Account'),
                    //       ),
                    //       SizedBox(
                    //         child: TextButton(
                    //             onPressed: widget.switchUser,
                    //             child: const Text('LogIn')),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                )),
          );
  }
}
