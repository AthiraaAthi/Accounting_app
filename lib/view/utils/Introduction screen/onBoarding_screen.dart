import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();
  final box = GetStorage();

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
            title: 'Simple & User-Friendly',
            body:
                'With a clean and intuitive design, FinFloww makes managing your money smooth and hassle-free.',
            image: SvgPicture.asset(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              'assets/svg/ui.svg',
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
      onDone: () {
        box.write('first_time', false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavScreen()),
        );
      },
      onSkip: () {
        box.write('first_time', false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavScreen()),
        );
      },
      dotsDecorator: DotsDecorator(
        size: const Size(7.0, 7.0),
        activeColor: primaryColorBlue,
        activeSize: const Size(30.0, 7.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      controlsPadding: const EdgeInsets.symmetric(vertical: 10),
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
}
