import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195.h,
      width: 160.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.grey.shade300,
          border: Border.all(color: Colors.black12, width: 0.5)),
      child: Column(
        children: [
          const ImageShimmer(),
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
              color: Colors.grey.shade300,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade50,
                  child: Container(
                    height: 10.h,
                    width: 50.w,
                    color: Colors.grey.shade300,
                  ),
                ),
                SizedBox(height: 5.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade50,
                  child: Container(
                    height: 10.h,
                    width: 50.w,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CarousalShimmerWidget extends StatelessWidget {
  const CarousalShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: Container(
        height: 175.h,
        width: 360.w,
        color: Colors.grey.shade300,
      ),
    );
  }
}

class CategoryShimmerWidget extends StatelessWidget {
  const CategoryShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Column(
        children: [
          SizedBox(
            height: 90.h,
            width: 360.w,
            child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: .32,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 3,
                  initialPage: 1,
                ),
                items: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade50,
                    child: CircleAvatar(
                      maxRadius: 45.r,
                      minRadius: 45.r,
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade50,
                    child: CircleAvatar(
                      maxRadius: 45.r,
                      minRadius: 45.r,
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade50,
                    child: CircleAvatar(
                      maxRadius: 45.r,
                      minRadius: 45.r,
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                ]),
          ),
          Center(
            child: DotsIndicator(
              dotsCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageShimmer extends StatelessWidget {
  const ImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: Container(
        height: 145.h,
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r),
            topRight: Radius.circular(5.r),
          ),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}

class CategoryProductImageShimmer extends StatelessWidget {
  const CategoryProductImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: Container(
        height: 170.h,
        width: 130.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r),
            topRight: Radius.circular(5.r),
          ),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}

class CartImageShimmer extends StatelessWidget {
  const CartImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: Container(
        height: 80.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r),
            topRight: Radius.circular(5.r),
          ),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}

class CategoryProductShimmerWidget extends StatelessWidget {
  const CategoryProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.black12, width: 0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade50,
              child: Container(
                height: 170.h,
                width: 130.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r),
                  ),
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade50,
                      child: Container(
                        height: 20.h,
                        width: 100.w,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade50,
                      child: Container(
                        height: 20.h,
                        width: 100.w,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade50,
                      child: Container(
                        width: 95.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(7.5.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartProductShimmer extends StatelessWidget {
  const CartProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 320.w,
      margin: EdgeInsets.only(bottom: 5.h, top: 5.h, left: 5.w, right: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.grey.shade300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade50,
            child: Container(
              height: 80.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey.shade300),
            ),
          ),
          SizedBox(width: 5.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade50,
                child: Container(
                  width: 95.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade50,
                    child: Container(
                      width: 30.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.circle,
                    size: 20.sp,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(width: 5.w),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade50,
                    child: Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(
                    Icons.circle,
                    size: 20.sp,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade50,
                child: Container(
                  width: 150.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
