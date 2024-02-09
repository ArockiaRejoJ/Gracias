import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/category_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int pageIndex = 0;
  Future getCategoryData() async {
    await Provider.of<CategoryProvider>(context, listen: false)
        .fetchProductCategory();
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
        ? SizedBox(
            height: 90.h,
            width: 360.w,
            child: Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )))
        : Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 90.h,
                  width: 360.w,
                  child: SizedBox(
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
                            return CircleAvatar(
                              maxRadius: 45.r,
                              minRadius: 45.r,
                              backgroundImage: NetworkImage(data.image!),
                            );
                          },
                        );
                      }).toList(),
                    ),
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
