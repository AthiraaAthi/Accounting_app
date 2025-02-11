import 'package:curved_nav/Application/Splash%20Screen/splash_bloc.dart';
import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((t) {
      context.read<SplashBloc>().add(OnStarted());
    });
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.afterLoaded) {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  NavScreen(),
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
          child: CircularProgressIndicator(
            color: primaryColorBlue,
          ),
        ),
      ),
    );
  }
}
