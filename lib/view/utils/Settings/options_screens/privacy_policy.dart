import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  static TextStyle pointsStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle explainationStyle = TextStyle(
    fontSize: 18,
  );
  final SizedBox titleSpace = SizedBox(height: 12);
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
          "Privacy Policy",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Effective Date: [ Date]",
                style: TextStyle(fontSize: 20),
              ),
              titleSpace,
              Text("1. Introduction", style: pointsStyle),
              titleSpace,
              Text(
                '''Welcome to LENDO. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the "LENDO"). By using the App, you agree to the collection and use of information in accordance with this policy. ''',
                style: explainationStyle,
                textAlign: TextAlign.justify,
              ),
              nextSpace,
              Text("2. Information We Collect", style: pointsStyle),
              titleSpace,
              Text(
                '''We collect the following types of information:
        •Personal Information: Name, phone number, email, and other necessary details to verify identity and facilitate transactions. 
        •Financial Information: Loan amount, repayment history, and other relevant financial details.
        •Device Information: IP address, device ID, operating system, and other technical information.
        •Advertising Data: We may collect ad interaction data for personalized advertising experiences. ''',
                textAlign: TextAlign.justify,
                style: explainationStyle,
              ),
              Text("3. How We Use Your Information", style: pointsStyle),
              titleSpace,
              Text(
                '''•Facilitate transactions between lenders and borrowers.
•Improve user experience and app performance.
•Comply with legal obligations.''',
                style: explainationStyle,
                textAlign: TextAlign.justify,
              ),
              nextSpace,
              Text(
                "5. Ads and Analytics",
                style: pointsStyle,
              ),
              titleSpace,
              Text(''' ''')
            ],
          ),
        ),
      ),
    );
  }
}
