import 'package:flutter/material.dart';
import 'package:taasa_life/screens/signup_screen.dart';

import '../decortaions/styles.dart';
import 'admin_signup.dart';

class SignInOptions extends StatefulWidget {
  final VoidCallback switchUser;
  const SignInOptions({super.key, required this.switchUser});

  @override
  State<SignInOptions> createState() => _SignInOptionsState();
}

class _SignInOptionsState extends State<SignInOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: Decorations.bgDecoration,
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AdminSignUpScreen(
                                      switchUser: widget.switchUser)));
                    },
                    child: const Text('SigIn as Medical center')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SignUpScreen(switchUser: widget.switchUser)));
                },
                child: const Text('SignIn as User')),
            const SizedBox(
              height: 350,
            ),
            Container(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  const SizedBox(
                    child: Text('Already Have Account'),
                  ),
                  SizedBox(
                    child: TextButton(
                        onPressed: widget.switchUser,
                        child: const Text('LogIn')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
