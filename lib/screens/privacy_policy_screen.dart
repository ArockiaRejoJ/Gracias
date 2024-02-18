import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
                'Welcome to Gracias Gifts & Events. This Privacy Policy outlines how we collect, use, disclose, and safeguard your personal information when you use our application or services. By accessing or using our services, you agree to the terms outlined in this policy.',
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
                'Information We Collect:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'We collect personal information, such as your name, address, email, and phone number, when you place an order or interact with our application.',
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
                'How We Use Your Information:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Your information is used to process and fulfill your orders, communicate with you about your orders, and provide a personalized experience on our application.',
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
                'Data Security:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'We implement industry-standard security measures to protect your personal information. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
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
                'Cookies:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Our application uses cookies to enhance your browsing experience. You can choose to disable cookies, but this may impact your ability to access certain features of our application.',
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
                'Third-Party Services:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'We may use third-party services to analyze application traffic, enhance functionality, and improve user experience. These third-party services may have their own privacy policies, which we encourage you to review.',
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
                'Sharing of Information:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'We do not sell, trade, or otherwise transfer your personal information to outside parties. This does not include trusted third parties who assist us in operating our Application, conducting our business, or servicing you.',
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
                'Your Consent:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'By using our application and services, you consent to our privacy policy.',
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
                'Children’s Online Privacy Protection Act (COPPA):',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Gracias Gifts & Events does not knowingly collect personal information from children under the age of 13. If you are under 13, please do not provide any information on our application.',
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
                'Changes to Privacy Policy:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Gracias Gifts & Events reserves the right to update or modify this Privacy Policy at any time. Changes will be posted on this page, and the effective date will be updated accordingly.',
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
                'Contact Information',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'If you have any questions or concerns about our Privacy Policy, please contact us at privacy@graciasgifts.com.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'By using our services, you acknowledge that you have read, understood, and agree to this Privacy Policy. It is your responsibility to review this policy periodically for changes.',
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
