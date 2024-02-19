import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    Provider.of<CartProvider>(context, listen: false).fetchNonceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          titleTextStyle: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.lexend().fontFamily,
            fontSize: 18.sp,
            color: Colors.black,
          ),
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
                      image: NetworkImage(widget.image!),
                      fit: BoxFit.cover,
                    ),
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
                                    ? Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: SizedBox(
                                          height: 10.h,
                                          width: 10.w,
                                          child:
                                              const CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
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
                                image: AssetImage('assets/images/facebook.png'),
                              ),
                            ),
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
                                image:
                                    AssetImage('assets/images/instagram.png'),
                              ),
                            ),
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
                                image: AssetImage('assets/images/whatsapp.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
        content: SizedBox(
          height: 325.h,
          width: 365.w,
          child: Column(
            children: [
              SizedBox(
                height: 150.h,
                width: 150.w,
                child: Image.asset(
                  'assets/images/logo.png',
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
                      borderRadius: BorderRadius.circular(10.r),
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
