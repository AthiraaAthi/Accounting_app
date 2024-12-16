import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              )),
          backgroundColor: primaryColorBlue,
          foregroundColor: white,
          title: Text("History"),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: ListTile(
                subtitle: Text("Balance Amount:1000"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: lightGreen,
                title: Text('01/01/2000---${index + 1}'),
                trailing: Text('-2000/-'),
              ),
            );
          },
        ));
  }
}
