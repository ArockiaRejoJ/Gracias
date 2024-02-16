import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Carousal extends StatefulWidget {
  const Carousal({super.key});

  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  final List<String> imgList = [
    'https://gracias.ae/wp-content/uploads/2024/02/gift.gif',
    'https://gracias.ae//wp-content//uploads//2024//01//Grasias-Banners-01-copy-1-scaled.jpg',
    'https://gracias.ae//wp-content//uploads//2024//01//Grasias-Banners-02-copy-1-scaled.jpg',
    'https://gracias.ae//wp-content//uploads//2024//01//Grasias-Banners-03-copy-1-scaled.jpg',
  ];

  @override
  Widget build(BuildContext context) {
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
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
        ),
        items: imgList.map(
          (data) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: 175.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 0.2),
                  ),
                  child: Image.network(
                    data,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    },
                    errorBuilder: (context, exception, stackTrace) {
                      return Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fitWidth,
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
  }
}
