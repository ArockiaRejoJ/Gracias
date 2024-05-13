import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/screens/home_screen.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  const OrderSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250.h,
              width: 250.w,
              child: Lottie.asset(
                'assets/images/Animation-2.json',
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 50.h,
              width: 300.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 800),
                      reverseDuration: const Duration(milliseconds: 400),
                      child: const HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  AppLocale.homeScreen.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
