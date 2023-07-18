import 'package:flutter/material.dart';
import 'package:taasa_life/screens/home_screen.dart';
import 'package:taasa_life/screens/map_screen.dart';
import 'package:taasa_life/screens/workout_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Map<String, dynamic>> navigationList = const [
    {'screen': HomeScreen(), 'title': 'home', 'icon': Icons.home},
    {'screen': MapScreen(), 'title': 'map', 'icon': Icons.map_rounded},
    {
      'screen': WorkOutScreen(),
      'title': 'wo',
      'icon': Icons.sports_gymnastics_rounded
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationList[pageIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 20,
          selectedItemColor: Colors.yellow,
          currentIndex: pageIndex,
          onTap: (currentPage) {
            setState(() {
              pageIndex = currentPage;
            });
          },
          items: navigationList
              .map((pick) => BottomNavigationBarItem(
                    icon: Icon(
                      pick['icon'],
                      color: const Color.fromARGB(255, 45, 103, 129),
                    ),
                    label: pick['title'],
                  ))
              .toList()),
    );
  }
}
