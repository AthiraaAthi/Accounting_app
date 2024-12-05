import 'package:curved_nav/view/utils/Home/home.dart';
import 'package:curved_nav/view/utils/Expense/expense_screen.dart';
import 'package:curved_nav/view/utils/Settings/settings_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int selectedIndex = 1;
  List<Widget> screens = const [
    ListScreen(),
    Home(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        tabBorderRadius: 15,
        gap: 8,
        selectedIndex: selectedIndex,
        tabs: [
          GButton(
            icon: Icons.calculate_outlined,
            text: 'Expense',
            textColor: primaryColorBlue,
            iconActiveColor: primaryColorBlue,
            backgroundColor: primaryColorBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            padding: EdgeInsets.all(10),
          ),
          GButton(
            icon: Icons.home_outlined,
            text: 'home',
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
