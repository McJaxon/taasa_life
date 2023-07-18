import 'package:flutter/material.dart';
import 'package:taasa_life/screens/login_screen.dart';
import 'package:taasa_life/screens/signup_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isSignIn = true;
  void switchUser() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignIn) {
      return LogInScreen(
        switchUser: switchUser,
      );
    } else {
      return SignUpScreen(
        switchUser: switchUser,
      );
    }
  }
}
