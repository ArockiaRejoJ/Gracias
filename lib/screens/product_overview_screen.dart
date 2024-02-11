import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductOverviewScreen extends StatefulWidget {
  final int? id;
  final String? title;
  final String? image;
  final String? price;
  final String? description;

  const ProductOverviewScreen(
      this.id, this.title, this.image, this.price, this.description,
      {super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _isLoading = false;
  final FlutterLocalization _localization = FlutterLocalization.instance;
  void launchWhatsApp() async {
    if (!await launchUrl(
        Uri.parse(
            "https://api.whatsapp.com/send/?phone=971557188002&text&type=phone_number&app_absent=0"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }
  }

  void launchFacebook() async {
    if (!await launchUrl(Uri.parse("https://www.facebook.com/gracias.ae"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }
  }

  void launchInstagram() async {
    if (!await launchUrl(
        Uri.parse("https://www.instagram.com/gracias.ae?igsh=bjNqMXplZDU4dGZj"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }
  }

  Future addToCart() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<CartProvider>(context, listen: false)
        .addProductToCart(widget.id!, 1)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    _showCartDialog();
  }

  @override
  Widget build(BuildContext context) {
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
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.lexend().fontFamily,
            fontSize: 18.sp,
            color: Colors.black,
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Share.share('');
          //       },
          //       icon: Icon(
          //         Icons.share,
          //         color: Colors.black,
          //         size: 22.sp,
          //       )),
          //   SizedBox(width: 10.w)
          // ],
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 360.w,
                  height: 300.h,
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
                          ],
                        ),
                        InkWell(
                          onTap: addToCart,
                          child: Container(
                            width: 95.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(7.5.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _isLoading
                                    ? SizedBox(
                                        height: 10.h,
                                        width: 10.w,
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Container(),
                                Text(
                                  'Add item',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: GoogleFonts.lexend().fontFamily,
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        iconColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        childrenPadding: EdgeInsets.all(10.h),
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
                                    widget.description!
                                        .replaceAll("<p>", "")
                                        .replaceAll("\"", "")
                                        .replaceAll("!</p>", "")
                                        .replaceAll(".</p>", ""),
                                    textAlign: TextAlign.justify,
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
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: launchFacebook,
                          child: Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://play-lh.googleusercontent.com/KCMTYuiTrKom4Vyf0G4foetVOwhKWzNbHWumV73IXexAIy5TTgZipL52WTt8ICL-oIo=w240-h480-rw'))),
                          ),
                        ),
                        InkWell(
                          onTap: launchInstagram,
                          child: Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://play-lh.googleusercontent.com/VRMWkE5p3CkWhJs6nv-9ZsLAs1QOg5ob1_3qg-rckwYW7yp1fMrYZqnEFpk0IoVP4LM=w240-h480-rw'))),
                          ),
                        ),
                        InkWell(
                          onTap: launchWhatsApp,
                          child: Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://play-lh.googleusercontent.com/ebs6ftYUkOKlDY0M174OpvargwbDyHUVAnO_G5aE0dL5GBQKCtfh3adN5H3ZMThXogDi=w240-h480-rw'))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _showCartDialog() async {
    int count = 0;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        content: Container(
          height: 325.h,
          width: 365.w,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.white,
          //     border: Border.all(color: Colors.red, width: 2)),
          child: Column(
            children: [
              SizedBox(
                height: 150.h,
                width: 150.w,
                child: Image.asset(
                  'assets/images/Grasias-Logo-2-01.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                'Product Added \n Successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 50.h,
                width: 340.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Continue Shopping',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.lexend().fontFamily,
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                },
                child: Text(
                  'Go to Home',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.lexend().fontFamily,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
