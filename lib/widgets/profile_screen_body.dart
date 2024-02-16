import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/screens/about_us_screen.dart';
import 'package:flutter_assignment_app/screens/order_screen.dart';
import 'package:flutter_assignment_app/screens/privacy_policy_screen.dart';
import 'package:flutter_assignment_app/screens/terms_and_conditions_screen.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              _languageModalBottomSheet(context);
            },
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.language,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Country & Languages',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrdersScreen(),
                ),
              );
            },
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'orders',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          const Divider(),
          SizedBox(height: 5.h),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsScreen(),
                ),
              );
            },
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen(),
                ),
              );
            },
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.privacy_tip_outlined,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsAndConditionsScreen(),
                ),
              );
            },
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          const Divider(),
          SizedBox(
            height: 5.h,
          ),
          InkWell(
            onTap: () {
              Share.share(
                  'Hey, I love Gracias & I think you will too! \n\nGracias Gifts & Events – Your Gateway to Heartwarming Surprises! \n\nDownload the app here: https://play.google.com/store/apps/details?id=com.gracias.app');
            },
            child: SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.ios_share,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Share with friends',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              'Version: 1.0.0',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _languageModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 80.h,
          width: 360.w,
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  _localization.translate('en');
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'English',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  _localization.translate('ar', save: true);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: bgColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'العربية',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
