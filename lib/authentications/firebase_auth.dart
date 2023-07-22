import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStoreAuthentication extends ChangeNotifier {
  CollectionReference fireStore =
      FirebaseFirestore.instance.collection('Health');
  Future snapShot(
      dynamic email, String password, String image, String date, String uid) {
    return fireStore.doc().set({
      'id': FirebaseAuth.instance.currentUser!.email,
      'nickName': '',
      'image': image,
      'date': DateTime.now().hour.toString(),
      'uid': FirebaseAuth.instance.currentUser!.uid
    });
  }
}

class FirebaseAuthentication extends ChangeNotifier {
  final FirebaseAuth authenticate = FirebaseAuth.instance;
  Stream<User?> get streamer {
    return authenticate.authStateChanges().map((User? user) => user);
  }

  Future createEmailAccount(String email, String password) async {
    try {
      UserCredential? results = await authenticate
          .createUserWithEmailAndPassword(email: email, password: password);
      User? users = results.user;
      await FireStoreAuthentication()
          .snapShot(users!.email, password, 'image', 'date', users.uid)
          .then((value) => FireStoreAuthentication()
              .fireStore
              .doc(users.email)
              .collection('messages')
              .doc()
              .collection('Chats'));
      return users;
    } catch (e) {
      return;
    }
  }

  Future signInEmail(String email, String password) async {
    try {
      UserCredential results = await authenticate.signInWithEmailAndPassword(
          email: email, password: password);
      User? users = results.user;
    } catch (e) {
      return;
    }
  }

  Future signOut() async {
    try {
      authenticate.signOut();
    } catch (e) {
      return;
    }
  }
}
