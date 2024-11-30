import 'package:curved_nav/view/home.dart';
import 'package:curved_nav/view/listscreen.dart';
import 'package:curved_nav/view/settings_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectedIndex = 0;
  List<Widget> screens = const [
    ListScreen(),
    Home(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          index: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          color: Colors.white,
          backgroundColor: Colors.blue,
          items: const [
            Icon(
              Icons.list,
              color: Colors.blue,
              size: 30,
            ),
            Icon(
              Icons.home_outlined,
              color: Colors.blue,
              size: 30,
            ),
            Icon(
              Icons.settings,
              color: Colors.blue,
              size: 30,
            ),
          ]),
    );
  }
}
