import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HelpCardWidget extends StatelessWidget {
  final String title;
  final String explanation;
  Widget? container;
  HelpCardWidget(
      {super.key,
      required this.title,
      required this.explanation,
      this.container});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(child: container),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              explanation,
              textAlign: TextAlign.justify,
              style: TextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
