import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(),
              )
            ],
          ),
        ));
  }
}
