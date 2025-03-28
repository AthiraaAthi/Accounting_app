import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: white,
      key: introKey,
      pages: [
        PageViewModel(
            title: 'Welcome to FinFloww!',
            body:
                'Take control of your finances with ease. FinFloww helps you track money from lenders and manage expenses effortlessly.',
            image: SvgPicture.asset(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              'assets/svg/welcome.svg',
            )),
        PageViewModel(
            title: 'Track Lender Transactions',
            body:
                'Keep a clear record of borrowed and lent money in one place. Never lose sight of due payments again!',
            image: SvgPicture.asset(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              'assets/svg/track.svg',
            )),
        PageViewModel(
            title: 'Smart Expense Tracking',
            body:
                'Easily record and categorize your daily expenses to understand where your money goes.',
            image: SvgPicture.asset(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              'assets/svg/expense.svg',
            )),
        PageViewModel(
            title: 'Terms and Conditions',
            body:
                'By using FinFloww, you agree to our terms and conditions. Goto Settings > Terms and Conditions to read them.',
            image: SvgPicture.asset(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              'assets/svg/terms.svg',
            )),
        PageViewModel(
            title: 'User manual',
            body:
                'Goto Settins > User manual to read the user manual of FinFloww.',
            image: SvgPicture.asset(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              'assets/svg/help.svg',
            )),
        PageViewModel(
            title: 'Ready to Take Control?',
            body:
                'Let’s get started! Set up your preferences and begin your journey to better money management.',
            image: SvgPicture.asset(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              'assets/svg/explore.svg',
            )),
      ],
      onDone: () async {
        box.write('first_time', false);
        bool isOnline = await InternetConnection().hasInternetAccess;
        if (isOnline) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavScreen()),
          );
        } else {
          _showNoInternetSnackbar();
        }
      },
      onSkip: () async {
        box.write('first_time', false);
        bool isOnline = await InternetConnection().hasInternetAccess;
        if (isOnline) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavScreen()),
          );
        } else {
          _showNoInternetSnackbar();
        }
      },
      dotsDecorator: DotsDecorator(
        size: const Size(5.0, 5.0),
        activeColor: primaryColorBlue,
        activeSize: const Size(30.0, 5.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      nextFlex: 0,
      skipOrBackFlex: 0,
      controlsPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: FaIcon(FontAwesomeIcons.arrowRight),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      skipStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(primaryColorBlue)),
      doneStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(primaryColorBlue)),
      nextStyle: ButtonStyle(
          shape: WidgetStatePropertyAll(
            CircleBorder(
              side: BorderSide(
                  color: primaryColorBlue,
                  width: 7,
                  strokeAlign: BorderSide.strokeAlignOutside),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(primaryColorBlue),
          iconColor: WidgetStatePropertyAll(white)),
    );
  }

  void _showNoInternetSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primaryColorBlue,
        content: Center(
          child: Text(
            'Please turn on the internet and try again!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
