import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
            title: 'Welcome',
            body: 'Introducing FinFlow',
            image: SvgPicture.asset('assets/svg/Resting.svg')),
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
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
