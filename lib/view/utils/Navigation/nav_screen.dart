import 'package:curved_nav/view/utils/Home/home.dart';
import 'package:curved_nav/view/utils/Expense/expense_screen.dart';
import 'package:curved_nav/view/utils/Settings/settings_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

final ValueNotifier _pagenotifier = ValueNotifier(1);

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List screens = const [
      ListScreen(),
      Home(),
      SettingsScreen(),
    ];
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          SystemNavigator.pop();
        },
        child: ValueListenableBuilder(
          valueListenable: _pagenotifier,
          builder: (context, value, _) {
            return screens[value];
          },
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _pagenotifier,
        builder: (context, value, _) {
          return SalomonBottomBar(
              backgroundColor: white,
              currentIndex: value,
              onTap: (value) {
                _pagenotifier.value = value;
              },
              selectedItemColor: primaryColorBlue,
              items: [
                SalomonBottomBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.calendarCheck,
                      size: 20,
                    ),
                    title: Text('Expense')),
                SalomonBottomBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 20,
                    ),
                    title: Text('Home')),
                SalomonBottomBarItem(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 20,
                    ),
                    title: Text('Settings')),
              ]);
        },
      ),
    );
  }
}

// GNav(
//             onTabChange: (value) {
//               _pagenotifier.value = value;
//             },
//             tabBorderRadius: 15,
//             gap: 8,
//             selectedIndex: value,
//             tabs: [
//               GButton(
//                 icon: Icons.calculate_outlined,
//                 text: 'Expense',
//                 textColor: primaryColorBlue,
//                 iconActiveColor: primaryColorBlue,
//                 backgroundColor: primaryColorBlue.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(20),
//                 padding: EdgeInsets.all(10),
//               ),
//               GButton(
//                 icon: Icons.home_outlined,
//                 text: 'home',
//               ),
//               GButton(
//                 icon: Icons.settings_outlined,
//                 text: 'Settings',
//               ),
//             ],
//           );
