import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/screens/product_overview_screen.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductContainerWidget extends StatelessWidget {
  final int? id;
  final String? title;
  final String? image;
  final String? price;
  final String? description;
  const ProductContainerWidget(
      {super.key,
      this.id,
      this.title,
      this.image,
      this.price,
      this.description});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductOverviewScreen(
                    id, title, image, price, description)));
      },
      child: Container(
        height: 195.h,
        width: 160.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: bgColor,
            border: Border.all(color: Colors.black12, width: 0.5)),
        child: Column(
          children: [
            Container(
              height: 145.h,
              width: 160.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  topRight: Radius.circular(5.r),
                ),
                image: DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 45.h,
              width: 140.w,
              padding:
                  EdgeInsets.only(left: 5.w, top: 5.h, right: 2.w, bottom: 0.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.r),
                  bottomRight: Radius.circular(5.r),
                ),
                color: bgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
