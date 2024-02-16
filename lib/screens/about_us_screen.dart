import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
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
                      'WHO WE ARE?',
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
                '🌍CONNECTING HEARTS ACROSS BORDERS: UAE TO SYRIA 🇦🇪❤️🇸🇾',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 22.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'At Gracias Gifts & Events, we believe that distance should never be a barrier to expressing love, joy, and warmth. With our unique and hassle-free service, you can now send a piece of your heart from the vibrant streets of Abu Dhabi to the charming cities of Syria. We take pride in being your trusted partner for spreading smiles, one thoughtful gift at a time.',
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
                'How It Works: Sending Joy Has Never Been Easier!🚚',
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
                        text: '1. Browse & Select: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Explore our categories and choose the perfect gift for your occasion.',
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
                        text: '2. Personalize: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Add a personal touch with a heartfelt message or special instructions.',
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
                        text: '3. Checkout: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Complete your order with our secure and easy-to-use checkout process.',
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
                        text: '4. Relax: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Leave the rest to us! Our team will ensure your gift is delivered promptly and with utmost care.',
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
                'Why Choose Gracias? 🌟',
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
                        text: '=> Seamless Delivery: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Our professional team in Syria is dedicated to ensuring your gifts reach their destination promptly and in perfect condition.',
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
                        text: '=> Wide Coverage: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'We deliver to all cities in Syria, bringing your thoughtful gestures to every doorstep.',
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
                        text: '=> Quality Assurance:: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'From the selection of gifts to the delivery process, we prioritize quality, ensuring your loved ones receive the best.',
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
                        text: '=> Easy Ordering: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.lexend().fontFamily,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Our user-friendly website makes it a breeze to select, order, and send gifts to your cherished ones.',
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
                'Embark on a journey of love and connection with Gracias. Join us in spreading happiness and creating unforgettable moments, one gift at a time. Start your joy-filled journey today! 🎉🎈',
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
    );
  }
}
