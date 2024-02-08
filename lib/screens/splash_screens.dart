import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          backgroundColor: Colors.white,
          duration: 1000,
          splashIconSize: 90.sp,
          splashTransition: SplashTransition.fadeTransition,
          splash: Image.asset('assets/images/Grasias-Logo-2-01.png'),
          nextScreen: const HomeScreen(),
        ),
      ),
    );
  }
}
