import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Carousal extends StatefulWidget {
  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  final List<String> imgList = [
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
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
        ),
        items: imgList.map((data) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.black26, width: 0.2),
                    image: DecorationImage(
                        image: NetworkImage(data.toString()),
                        fit: BoxFit.fill)),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
