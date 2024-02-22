import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  TermsAndConditionsScreen({super.key});
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocale.termsAndConditionsTitle.getString(context),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocale.termsAndConditionsParagraph.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle1.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph1.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle12.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph12.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle3.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph3.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle4.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph4.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle5.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph5.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle6.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph6.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle7.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph7.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle8.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph8.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsTitle9.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  AppLocale.termsAndConditionsParagraph9.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.termsAndConditionsParagraph10.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
