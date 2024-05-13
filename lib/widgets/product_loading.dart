import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/widgets/shimmer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductLoadingWidget extends StatelessWidget {
  const ProductLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(10.h),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 10.h,
          mainAxisExtent: 200.h,
        ),
        itemCount: 6,
        itemBuilder: (_, index) => const ProductShimmerWidget());
  }
}
