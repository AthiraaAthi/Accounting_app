import 'package:curved_nav/view/utils/Settings/options_screens/help_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/gestures.dart';
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
    color: black,
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
          "Terms & Conditions",
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
              titleSpace,
              Text("1. Introduction", style: pointsStyle),
              titleSpace,
              Text(
                '''Welcome to LENDO ("we", "our", "us"). These Terms and Conditions govern your use of our mobile application available on the Google Play Store. By downloading and using our app, you agree to comply with these terms.''',
                style: explainationStyle,
                textAlign: TextAlign.justify,
              ),
              nextSpace,
              Text(
                "2. Description of Service",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                '''LENDO is an accounting application designed for money lenders and borrowers to track payments, pending dues, and financial transactions.''',
                style: explainationStyle,
                textAlign: TextAlign.justify,
              ),
              nextSpace,
              Text(
                "3. User Eligibility",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                '''By using this app, you confirm that you are:
        • At least 18 years old or have the consent of a legal guardian.''',
                textAlign: TextAlign.justify,
                style: explainationStyle,
              ),
              nextSpace,
              Text(
                "4. Advertisements",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                ''' Our app displays third-party advertisements in compliance with Google Play Ads Policies.''',
                textAlign: TextAlign.justify,
                style: explainationStyle,
              ),
              nextSpace,
              Text(
                "5. Restrictions and Prohibited Uses",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                ''' Users agree NOT to:
• Use the app for illegal financial activities or unauthorized lending.
• Misuse any features to commit fraud or manipulate transactions.
• Modify, distribute, or exploit app services beyond their intended use.''',
                style: explainationStyle,
                textAlign: TextAlign.justify,
              ),
              nextSpace,
              Text(
                "6. Changes to These Terms",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                ''' We may update these terms at any time. Continued use of the app after modifications implies acceptance.''',
                style: explainationStyle,
                textAlign: TextAlign.justify,
              ),
              nextSpace,
              Text("7. Contact Us", style: pointsStyle),
              titleSpace,
              RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(text: "", children: [
                    TextSpan(
                      text:
                          '''For any questions regarding these Terms and Conditions, ''',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: 'contact us',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpScreen()));
                        },
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
