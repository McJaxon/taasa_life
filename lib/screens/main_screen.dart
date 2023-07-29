import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:taasa_life/screens/home_screen.dart';
import 'package:taasa_life/screens/map_screen.dart';
import 'package:taasa_life/screens/workout_screen.dart';

class MainScreen extends StatefulWidget {
  final String? profession;
  const MainScreen({this.profession, super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Map<String, dynamic>> navigationList = [
    {'screen': HomeScreen(), 'title': 'home', 'icon': Icons.home},
    {'screen': MapScreen(), 'title': 'map', 'icon': Icons.map_rounded},
    {
      'screen': WorkOutScreen(),
      'title': 'wo',
      'icon': Icons.sports_gymnastics_rounded
    }
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationList[pageIndex]['screen'],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: GNav(
              onTabChange: (currentPage) {
                setState(() {
                  pageIndex = currentPage;
                });
              },
              gap: 8,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.lightGreen,
              tabBackgroundGradient: const LinearGradient(colors: [
                Color.fromARGB(255, 192, 225, 252),
                Color.fromARGB(255, 250, 241, 164)
              ]),
              padding: const EdgeInsets.all(12),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.map_rounded,
                  text: 'maps',
                ),
                GButton(
                  icon: Icons.sports_gymnastics_rounded,
                  text: 'wo',
                ),
              ]),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     backgroundColor: Colors.transparent,
      //     selectedFontSize: 20,
      //     selectedItemColor: Colors.yellow,
      //     currentIndex: pageIndex,
      //     onTap: (currentPage) {
      //       setState(() {
      //         pageIndex = currentPage;
      //       });
      //     },
      //     items: navigationList
      //         .map((pick) => BottomNavigationBarItem(
      //               icon: Icon(
      //                 pick['icon'],
      //                 color: const Color.fromARGB(255, 45, 103, 129),
      //               ),
      //               label: pick['title'],
      //             ))
      //         .toList()),
    );
  }
}
