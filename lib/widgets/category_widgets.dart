import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/category_provider.dart';
import 'package:flutter_assignment_app/screens/category_product_screen.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/widgets/loading_widget.dart';
import 'package:flutter_assignment_app/widgets/shimmer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryWidget extends StatefulWidget {
  final bool isArabic;
  const CategoryWidget(this.isArabic, {super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int pageIndex = 0;
  Future getCategoryData() async {
    await Provider.of<CategoryProvider>(context, listen: false)
        .fetchProductCategory(widget.isArabic);
  }

  @override
  void initState() {
    getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryProvider>(context).categoryItems;
    return categoryData.isEmpty
        ? const CategoryShimmerWidget()
        : Padding(
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
                      onPageChanged: (val, value) {
                        setState(() {
                          pageIndex = val;
                        });
                      },
                    ),
                    items: categoryData.map((data) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 800),
                                  reverseDuration:
                                      const Duration(milliseconds: 400),
                                  child: CategoryByProductScreen(
                                      data.id, widget.isArabic, data.name),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              maxRadius: 45.r,
                              minRadius: 45.r,
                              backgroundColor: Colors.grey.shade300,
                              child: Image.network(
                                data.image != null
                                    ? data.image!
                                    : 'https://gracias.ae/wp-content/uploads/2024/01/Grasias-Logo-2-01-1024x654.png',
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade50,
                                    child: CircleAvatar(
                                      maxRadius: 45.r,
                                      minRadius: 45.r,
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Center(
                  child: DotsIndicator(
                    dotsCount: categoryData.length,
                    position: pageIndex,
                  ),
                ),
              ],
            ),
          );
  }
}
