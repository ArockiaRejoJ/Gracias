import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/providers/product_provider.dart';
import 'package:flutter_assignment_app/screens/home_screen.dart';
import 'package:flutter_assignment_app/screens/product_overview_screen.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_assignment_app/widgets/loading_widget.dart';
import 'package:flutter_assignment_app/widgets/shimmer_widget.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CategoryByProductScreen extends StatefulWidget {
  final int? categoryId;
  final bool isArabic;
  final String? name;
  const CategoryByProductScreen(this.categoryId, this.isArabic, this.name,
      {super.key});

  @override
  State<CategoryByProductScreen> createState() =>
      _CategoryByProductScreenState();
}

class _CategoryByProductScreenState extends State<CategoryByProductScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  Future? productsByCategoryFuture;
  final int _currentPage = 1;
  bool _isLoading = false;
  int? selectedIndex;
  bool _isFirstLoading = false;
  Future addToCart(int id) async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<CartProvider>(context, listen: false)
        .addProductToCart(id, 1)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    _showCartDialog();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).fetchData();
    productsByCategoryFuture = _loadProducts();
  }

  Future _loadProducts() {
    return Provider.of<ProductProvider>(context, listen: false)
        .fetchCategoryProduct(widget.isArabic, _currentPage, widget.categoryId!)
        .then((value) => {
              setState(() {
                _isFirstLoading = true;
              }),
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _isFirstLoading = false;
                });
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    final productData =
        Provider.of<ProductProvider>(context).productByCategoryById;
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name!),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: productsByCategoryFuture,
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LoadingWidget(200, 360));
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text(
                    AppLocale.apiErrorText.getString(context),
                  ),
                );
              } else {
                return Consumer<ProductProvider>(
                  builder: (context, ordersData, _) {
                    return productData.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100.h,
                                  width: 150.w,
                                  child: Image.asset('assets/images/empty.png'),
                                ),
                                SizedBox(height: 5.h),
                                Text(AppLocale.noProductsFound
                                    .getString(context)),
                              ],
                            ),
                          )
                        : ListView.builder(
                            //controller: _scrollController,
                            padding: EdgeInsets.all(10.h),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: productData.length,
                            itemBuilder: (_, index) => _isFirstLoading
                                ? const CategoryProductShimmerWidget()
                                : Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              duration: const Duration(
                                                  milliseconds: 800),
                                              reverseDuration: const Duration(
                                                  milliseconds: 400),
                                              child: ProductOverviewScreen(
                                                  productData[index].id,
                                                  productData[index].title,
                                                  productData[index].thumbnail,
                                                  productData[index].price,
                                                  productData[index]
                                                      .description)),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            color: bgColor,
                                            border: Border.all(
                                                color: Colors.black12,
                                                width: 0.5)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              productData[index].thumbnail!,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return Container(
                                                    height: 170.h,
                                                    width: 130.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                5.r),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                5.r),
                                                      ),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            productData[index]
                                                                .thumbnail!),
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return const CategoryProductImageShimmer();
                                              },
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(15.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      productData[index].title!,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            GoogleFonts.lexend()
                                                                .fontFamily,
                                                        fontSize: 18.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Text(
                                                      '\$ ${productData[index].price!}  ',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            GoogleFonts.lexend()
                                                                .fontFamily,
                                                        fontSize: 18.sp,
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        addToCart(
                                                            productData[index]
                                                                .id!);
                                                        setState(() {
                                                          selectedIndex = index;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 95.w,
                                                        height: 30.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      7.5.r),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            _isLoading &&
                                                                    selectedIndex ==
                                                                        index
                                                                ? Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right: 5
                                                                            .w),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          10.h,
                                                                      width:
                                                                          10.w,
                                                                      child:
                                                                          const CircularProgressIndicator(
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Container(),
                                                            Text(
                                                              AppLocale
                                                                  .productOverviewAddItem
                                                                  .getString(
                                                                      context),
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily: GoogleFonts
                                                                        .lexend()
                                                                    .fontFamily,
                                                                fontSize: 14.sp,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ],
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
                                    ),
                                  ),
                          );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }

  Future _showCartDialog() async {
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
                AppLocale.addToCartAlertBox1.getString(context),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.lexend().fontFamily,
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
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
                    AppLocale.addToCartAlertBoxButton1.getString(context),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.lexend().fontFamily,
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 800),
                      reverseDuration: const Duration(milliseconds: 400),
                      child: const HomeScreen(
                        selectedPage: 1,
                      ),
                    ),
                    // MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(
                    //     selectedPage: 1,
                    //   ),
                    // ),
                  );
                },
                child: Text(
                  AppLocale.addToCartAlertButton2.getString(context),
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
