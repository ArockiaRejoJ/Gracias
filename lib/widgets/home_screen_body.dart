import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:flutter_assignment_app/widgets/carousel_widget.dart';
import 'package:flutter_assignment_app/widgets/loading_widget.dart';
import 'package:flutter_assignment_app/widgets/products_widget.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_assignment_app/widgets/category_widgets.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  bool isLoading = false;
  bool? isArabic;
  final FlutterLocalization _localization = FlutterLocalization.instance;

  void loadingState() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void languageSelection() {
    if (_localization.currentLocale == const Locale("en", "US")) {
      setState(() {
        isArabic = false;
      });
    } else {
      setState(() {
        isArabic = true;
      });
    }
  }

  @override
  void initState() {
    languageSelection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 30.sp,
                    color: fontColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 12.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'UAE',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: 12.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  _languageModalBottomSheet(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
                      size: 20.sp,
                      color: fontColor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'language',
                          style: TextStyle(
                            color: fontColor,
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          _localization.currentLocale ==
                                  const Locale("en", "US")
                              ? 'English'
                              : 'العربية',
                          style: TextStyle(
                            color: fontColor,
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 2.w),
                    Icon(
                      Icons.language,
                      size: 30.sp,
                      color: fontColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Carousal(isArabic!),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    'GRACIAS CATEGORIES',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.lexend().fontFamily,
                      fontSize: 22.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                CategoryWidget(isArabic!),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    'GRACIAS PRODUCTS',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.lexend().fontFamily,
                      fontSize: 22.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                isLoading
                    ? const LoadingWidget(200, 360)
                    : ProductsWidget(isArabic!),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: launchFacebook,
                        child: Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/facebook.png'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: launchInstagram,
                        child: Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/instagram.png'),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: launchWhatsApp,
                        child: Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/whatsapp.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(height: 5.h),
                Center(
                  child: Container(
                    height: 225.h,
                    width: 340.w,
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Theme.of(context).primaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Visit Us :',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '8th Floor, ADIB Building, Najda Street, Abu Dhabi.',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: SizedBox(
                            height: 75.h,
                            width: 200.w,
                            child: Image.asset('assets/images/logo-white.png'),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Welcome to Gracias Gifts & Events – Your Gateway to \nHeartwarming Surprises!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                const Divider(),
              ],
            ),
          ),
        )
      ],
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
                  setState(() {
                    isArabic = false;
                  });
                  loadingState();
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
                  setState(() {
                    isArabic = true;
                  });
                  loadingState();
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
