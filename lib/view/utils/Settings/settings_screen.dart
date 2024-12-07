import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ));
  }
}
