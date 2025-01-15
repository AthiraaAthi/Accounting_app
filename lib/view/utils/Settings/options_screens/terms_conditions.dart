import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  static TextStyle pointsStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle explainationStyle = TextStyle(
    fontSize: 18,
  );
  final SizedBox titleSpace = SizedBox(height: 15);
  final SizedBox nextSpace = SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms & Conditions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            titleSpace,
            Text("1. Introduction", style: pointsStyle),
            titleSpace,
            Text(
              '''Welcome to [Your App Name] ("we", "our", "us"). These Terms and Conditions govern your use of our mobile application available on the Google Play Store. By downloading and using our app, you agree to comply with these terms.''',
              style: explainationStyle,
            ),
            nextSpace,
            Text("2. Description of Service")
          ],
        ),
      ),
    );
  }
}
