import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/banner_provider.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_assignment_app/widgets/shimmer_widget.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Carousal extends StatefulWidget {
  final bool isArabic;
  const Carousal(this.isArabic, {super.key});

  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  Future? _bannerFuture;
  Future getBannerData() async {
    return await Provider.of<BannerProvider>(context, listen: false)
        .fetchBannerData(widget.isArabic);
  }

  @override
  void initState() {
    _bannerFuture = getBannerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bannerData = Provider.of<BannerProvider>(context).bannerItems;
    return FutureBuilder(
      future: _bannerFuture,
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return const CarousalShimmerWidget();
        } else {
          if (dataSnapshot.error != null) {
            return Center(
              child: Text(AppLocale.apiErrorText.getString(context)),
            );
          } else {
            return Consumer<BannerProvider>(
              builder: (context, pData, _) {
                return SizedBox(
                  height: 175.h,
                  width: 360.w,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      aspectRatio: 2,
                      initialPage: 1,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    items: bannerData.map(
                      (data) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: 175.h,
                              width: 360.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black26, width: 0.2),
                              ),
                              child: Image.network(
                                data.image,
                                fit: BoxFit.fill,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const CarousalShimmerWidget();
                                },
                                errorBuilder: (context, exception, stackTrace) {
                                  return Image.asset(
                                    'assets/images/logo.png',
                                    fit: BoxFit.fitHeight,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                );
              },
            );
          }
        }
      },
    );
  }
}
