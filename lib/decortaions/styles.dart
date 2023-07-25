import 'package:flutter/material.dart';
import 'package:get/get.dart';

const primary = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/doc.jpg'), fit: BoxFit.cover));

const primary1 = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/natural.jpg'), fit: BoxFit.cover));

const primary2 = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/wall.jpg'), fit: BoxFit.cover));

const text = InputDecoration(
    hintStyle: TextStyle(
        color: Colors.black,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),
    enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 45, 103, 129), width: 3),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))));

const text2 = InputDecoration(
    hintStyle: TextStyle(
        color: Colors.black,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),
    enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 45, 103, 129), width: 3),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))));

class Decorations {
  static BoxDecoration bgImage1 = primary1;
  static BoxDecoration bgImage = primary2;
  static BoxDecoration bgDecoration = primary;
  static InputDecoration decoration = text;
  static InputDecoration decoration2 = text2;
}

final List<Map<String, dynamic>> assistList = [
  {
    'picture': 'insurance.png',
    'title': 'Insurance details',
  },
  {
    'picture': 'bank.png',
    'title': 'Bank details',
  },
];
final List<Map<String, dynamic>> assistsList = [
  {
    'picture1': 'emer.jpg',
    'title1': 'Medical details',
  },
  {
    'picture1': 'plus.png',
    'title1': 'Next of Kin',
  }
];

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}
