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
  List<Widget> screens = const [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
    );
  }
}
