import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taasa_life/authentications/firebase_auth.dart';
import 'package:taasa_life/screens/wrapper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FirebaseAuthentication()),
      ChangeNotifierProvider(create: (context) => FirebaseAuthentication())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: null,
      value: FirebaseAuthentication().streamer,
      child: MaterialApp(
        home: const Wrapper(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
      ),
    );
  }
}
