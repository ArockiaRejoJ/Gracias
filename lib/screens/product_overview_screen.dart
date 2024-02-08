import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductOverviewScreen extends StatefulWidget {
  final int? id;
  final String? title;
  final String? image;
  final String? price;
  final String? description;
  // final double? discountPercentage;
  // final double? rating;
  // final int? stock;
  // final String? brand;
  // final String? category;
  // final String? thumbnail;

  const ProductOverviewScreen(
      this.id, this.title, this.image, this.price, this.description,
      // this.discountPercentage,
      // this.rating,
      // this.stock,
      // this.brand,
      // this.category,
      // this.thumbnail,
      {super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    // final productData = Provider.of<ProductProvider>(context).productItems;
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22.sp,
              ),
            ),
          ),
          title: Text(widget.title!),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.lexend().fontFamily,
            fontSize: 18.sp,
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 3,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 360.w,
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(widget.image!), fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.lexend().fontFamily,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                    // SizedBox(height: 5.h),
                    // RichText(
                    //   text: TextSpan(
                    //     text: 'Seller : ',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w500,
                    //       fontFamily: GoogleFonts.lexend().fontFamily,
                    //       fontSize: 14.sp,
                    //       color: Colors.black,
                    //     ),
                    //     children: [
                    //       TextSpan(
                    //         text: widget.brand!,
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w500,
                    //           fontFamily: GoogleFonts.lexend().fontFamily,
                    //           fontSize: 14.sp,
                    //           color: Theme.of(context).primaryColor,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '\$ ${widget.price!}  ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.lexend().fontFamily,
                                fontSize: 18.sp,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            // Container(
                            //   height: 15,
                            //   width: 48,
                            //   decoration: BoxDecoration(
                            //       color: Theme.of(context)
                            //           .primaryColor
                            //           .withOpacity(0.5),
                            //       borderRadius: BorderRadius.circular(3)),
                            //   child: Center(
                            //     child: Text(
                            //       '${widget.discountPercentage!}% Off',
                            //       style: TextStyle(
                            //         fontWeight: FontWeight.w500,
                            //         fontFamily: GoogleFonts.lexend().fontFamily,
                            //         fontSize: 10.sp,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        InkWell(
                          onTap: () async {},
                          child: Container(
                            width: 95.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(7.5
                                  // topLeft: Radius.circular(5.0),
                                  // bottomLeft: Radius.circular(5.0),
                                  ),
                            ),
                            child: Center(
                              child: Text(
                                'Add item',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.lexend().fontFamily,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(),
                    Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        iconColor: Colors.black,
                        //collapsedIconColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        childrenPadding: EdgeInsets.all(10),
                        // expandedAlignment: Alignment.topLeft,
                        title: Text(
                          'About Product',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${widget.description}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          GoogleFonts.lexend().fontFamily,
                                      fontSize: 14.sp,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Similar Products',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.lexend().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 190.h,
              //   width: 375.w,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       padding: EdgeInsets.only(left: 7.w),
              //       shrinkWrap: true,
              //       physics: const BouncingScrollPhysics(),
              //       itemCount: productData.length,
              //       itemBuilder: (_, index) =>
              //           widget.id != productData[index].id &&
              //                   widget.category == productData[index].category
              //               ? ProductCardWidget(
              //                   productData[index].id!,
              //                   productData[index].title!,
              //                   productData[index].description!,
              //                   productData[index].price!,
              //                   productData[index].discountPercentage!,
              //                   productData[index].rating!,
              //                   productData[index].stock!,
              //                   productData[index].brand,
              //                   productData[index].category,
              //                   productData[index].thumbnail)
              //               : Container()),
              // ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
