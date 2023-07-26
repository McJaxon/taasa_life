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
        padding: const EdgeInsets.all(5),
        decoration: Decorations.bgDecoration,
        child: ListView(
          children: [
            const SizedBox(
              height: 200,
            ),
            const SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      'Choose',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                      child: Text(
                    'How you would like to signin',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AdminSignUpScreen(
                                          switchUser: widget.switchUser)));
                        },
                        child: const Text(
                          'Health assist',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 45, 103, 129)),
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SignUpScreen(switchUser: widget.switchUser)));
                  },
                  child: const Text(
                    'User',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 45, 103, 129)),
                  )),
            ),
            const SizedBox(
              height: 300,
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
