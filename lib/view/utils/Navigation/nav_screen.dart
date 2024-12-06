import 'package:curved_nav/view/utils/Home/home.dart';
import 'package:curved_nav/view/utils/Expense/expense_screen.dart';
import 'package:curved_nav/view/utils/Settings/settings_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

final ValueNotifier _pagenotifier = ValueNotifier(0);

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      ListScreen(),
      Home(),
      SettingsScreen(),
    ];
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _pagenotifier,
        builder: (context, value, child) {
          return screens[value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _pagenotifier,
        builder: (context, value, child) {
          return GNav(
            onTabChange: (value) {
              _pagenotifier.value = value;
            },
            tabBorderRadius: 15,
            gap: 8,
            selectedIndex: value,
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
          );
        },
      ),
    );
  }
}
