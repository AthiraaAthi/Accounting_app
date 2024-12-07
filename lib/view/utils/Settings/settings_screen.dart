import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> options = [
    "Notifications",
    "Getting Started",
    "Help",
    "Privacy Policy",
    "Terms & Conditions"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 30),
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
                    title: Text(
                      options[index],
                      style: TextStyle(fontSize: 19),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
