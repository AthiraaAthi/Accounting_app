import 'package:curved_nav/Application/Splash%20Screen/splash_bloc.dart';
import 'package:curved_nav/view/utils/Introduction%20screen/onBoarding_screen.dart';
import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((t) {
      context.read<SplashBloc>().add(OnStarted());
    });
    bool isFirstTime = box.read('first_time') ?? true;
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.afterLoaded) {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  isFirstTime ? OnboardingScreen() : NavScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: primaryColorBlue,
        body: Center(
            child: Image.asset(
          'assets/logo/png logo.png',
          scale: 5,
        )),
      ),
    );
  }
}
