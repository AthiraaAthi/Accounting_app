import 'package:curved_nav/view/utils/Home/home.dart';
import 'package:curved_nav/view/utils/Expense/expense_screen.dart';
import 'package:curved_nav/view/utils/Settings/settings_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
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
          backgroundColor: ColorConstant.defBlue,
          items: [
            Icon(
              Icons.list,
              color: ColorConstant.defBlue,
              size: 30,
            ),
            Icon(
              Icons.home_outlined,
              color: ColorConstant.defBlue,
              size: 30,
            ),
            Icon(
              Icons.settings,
              color: ColorConstant.defBlue,
              size: 30,
            ),
          ]),
    );
  }
}
