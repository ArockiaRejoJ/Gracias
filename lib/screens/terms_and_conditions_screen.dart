import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
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
                'Welcome to Gracias Gifts & Events! Before using our services, please read the following terms and conditions carefully. By accessing or using our website and services, you agree to abide by these terms.',
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
                      'Acceptance of Terms:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.lexend().fontFamily,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
              SizedBox(height: 5.h),
              Text(
                'By accessing or using Gracias Gifts & Events, you agree to comply with and be bound by these terms and conditions. If you do not agree with any part of these terms, please refrain from using our service',
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
                'Payment Methods:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Gracias Gifts & Events accepts payments in cash or via bank transfer only. We do not currently support credit/debit card payments. All payments must be made in the currency specified on the invoice.',
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
                'Order Confirmation:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Once you place an order through our website, you will receive an order confirmation via email. This confirmation does not guarantee the availability of the products but acknowledges that we have received your order.',
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
                'Delivery Information:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'We strive to ensure timely and secure delivery of your gifts. Delivery times may vary based on the destination and the nature of the products ordered. Please refer to our delivery information for more details.',
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
                'Returns and Refunds:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Due to the nature of our products, we do not accept returns. In the case of damaged or defective items, please contact our customer support team within 48 hours of receiving the order, providing detailed information and supporting evidence for further assistance.',
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
                'Privacy Policy:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Gracias Gifts & Events is committed to protecting your privacy. Please review our Privacy Policy to understand how we collect, use, and safeguard your personal information.',
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
                'Intellectual Property:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'All content, logos, images, and designs on the Gracias Gifts & Events website are the intellectual property of Gracias Gifts & Events. Any unauthorized use, reproduction, or distribution is strictly prohibited.',
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
                'Changes to Terms):',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Gracias Gifts & Events reserves the right to update or modify these terms and conditions at any time without prior notice. It is your responsibility to review these terms periodically for changes.',
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
                'Contact Information:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'If you have any questions or concerns about these terms and conditions, please contact us at support@graciasgifts.com.',
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
                'By using our services, you acknowledge that you have read, understood, and agree to these terms and conditions. Gracias Gifts & Events reserves the right to refuse service to anyone for any reason at any time.',
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
