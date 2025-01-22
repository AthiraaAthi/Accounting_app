import 'package:curved_nav/view/utils/Settings/options_screens/help_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/gestures.dart';
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
              Text("1. Introduction", style: pointsStyle),
              titleSpace,
              Text(
                '''Welcome to LENDO. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the "LENDO"). By using the App, you agree to the collection and use of information in accordance with this policy.aaaaa''',
                style: explainationStyle,
                textAlign: TextAlign.justify,
              ),
              nextSpace,
              Text("2. Information We Collect", style: pointsStyle),
              titleSpace,
              Text(
                '''We collect the following types of information:
        •Personal Information: Name, phone number, and other necessary details to verify identity and facilitate transactions. 
        •Financial Information: Loan amount, repayment history, and other relevant financial details.
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
              ),
              nextSpace,
              Text(
                "4. Ads and Analytics",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                '''Our app includes third-party ads that may collect and use data for personalized advertising. These ads are provided by services such as Google AdMob.''',
                style: explainationStyle,
              ),
              nextSpace,
              Text(
                "5. Data Security",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                ''' We take reasonable measures to protect your information from unauthorized access, loss, or misuse. However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security.''',
                style: explainationStyle,
              ),
              nextSpace,
              Text(
                "6.User Rights and Choices",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                ''' •Access, update, or delete their personal information.''',
                style: explainationStyle,
              ),
              nextSpace,
              Text(
                "7.Children's Privacy",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                ''' Our app is not intended for users under the age of 18. We do not knowingly collect personal data from minors. If we become aware of such data, we will take steps to remove it.''',
                style: explainationStyle,
              ),
              nextSpace,
              Text(
                "8. Changes to This Privacy Policy",
                style: pointsStyle,
              ),
              titleSpace,
              Text(
                ''' We may update this policy at any time. We will notify you of any changes by posting the new policy on this page.''',
                style: explainationStyle,
              ),
              nextSpace,
              Text(
                "9. Contact Us",
                style: pointsStyle,
              ),
              titleSpace,
              RichText(
                text: TextSpan(
                  text: "",
                  children: [
                    TextSpan(
                      text:
                          ''' If you have any questions or concerns about this Privacy Policy, please ''',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextSpan(
                      text: "Contact Us",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpScreen()));
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
