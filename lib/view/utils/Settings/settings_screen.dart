import 'package:curved_nav/view/utils/Settings/options_screens/category_settings.dart';
import 'package:curved_nav/view/utils/Settings/options_screens/getting_started.dart';
import 'package:curved_nav/view/utils/Settings/options_screens/help_screen.dart';

import 'package:curved_nav/view/utils/Settings/options_screens/privacy_policy.dart';
import 'package:curved_nav/view/utils/Settings/options_screens/terms_conditions.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  List<String> options = [
    'Categories',
    "User manual",
    "Help & Feedback",
    "Privacy Policy",
    "Terms & Conditions"
  ];
  List<Widget> optionsScreens = [
    CategorySettings(),
    GettingStarted(
      type: NavigatingFrom.SettingsPage,
    ),
    HelpScreen(),
    PrivacyPolicy(),
    TermsConditions()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => optionsScreens[index],
                          ));
                    },
                    title: Text(
                      options[index],
                      style: TextStyle(fontSize: 19),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),
              Spacer(),
              Text(
                "App Version",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Text(
                "v1.0.0",
                style: TextStyle(
                    color: const Color.fromARGB(255, 198, 196, 196),
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ));
  }
}
