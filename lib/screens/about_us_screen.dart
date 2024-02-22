import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
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
            AppLocale.aboutUsTitle.getString(context),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 150.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/about-us-bg.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(
                        AppLocale.aboutUsImageTitle.getString(context),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 26.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.aboutUsTitle1.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 22.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocale.aboutUsParagraph1.getString(context),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  AppLocale.aboutUsTitle2.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: AppLocale.bulletPoint1Title.getString(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocale.bulletPoint1Paragraph
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppLocale.bulletPoint2Title.getString(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocale.bulletPoint2Paragraph
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppLocale.bulletPoint3Title.getString(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocale.bulletPoint3Paragraph
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppLocale.bulletPoint4Title.getString(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocale.bulletPoint4Paragraph
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  AppLocale.aboutUsTitle3.getString(context),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: AppLocale.symbolPoint1Title.getString(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocale.symbolPoint1Paragraph
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppLocale.symbolPoint2Title.getString(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocale.symbolPoint2Paragraph
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppLocale.symbolPoint3Title.getString(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocale.symbolPoint3Paragraph
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppLocale.symbolPoint4Title.getString(context),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocale.symbolPoint4Paragraph
                                  .getString(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  AppLocale.aboutUsParagraph2.getString(context),
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
