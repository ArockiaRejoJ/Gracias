import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/screens/checkout_screen.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_assignment_app/widgets/shimmer_widget.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({super.key});

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  Future? cartFuture;
  bool isLoading = false;
  bool _isFirstLoading = false;

  Future getCartData() async {
    return Provider.of<CartProvider>(context, listen: false)
        .fetchData()
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

  void loadingState() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    loadingState();
    cartFuture = getCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartDetailsData = Provider.of<CartProvider>(context).cartItems;
    final cartProductData =
        Provider.of<CartProvider>(context).cartProdductItems;
    return isLoading
        ? Center(
            child: SizedBox(
              height: 250.h,
              width: 250.w,
              child: Image.asset(
                'assets/images/download.gif',
              ),
            ),
          )
        : Consumer<CartProvider>(builder: (context, pData, _) {
            return pData.cartProdductItems.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              color: bgColor,
                            ),
                            child: Consumer<CartProvider>(
                              builder: (context, cartData, _) {
                                return cartData.cartProdductItems.isNotEmpty
                                    ? ListView.builder(
                                        itemCount:
                                            cartData.cartProdductItems.length,
                                        scrollDirection: Axis.vertical,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            _isFirstLoading
                                                ? const CartProductShimmer()
                                                : cartData
                                                            .cartProdductItems[
                                                                index]
                                                            .quantity !=
                                                        0
                                                    ? Container(
                                                        height: 85.h,
                                                        width: 320.w,
                                                        margin: EdgeInsets.only(
                                                            bottom: 8.h,
                                                            top: 8.h,
                                                            left: 5.w,
                                                            right: 5.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            color:
                                                                Colors.white),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image.network(
                                                              cartData
                                                                  .cartProdductItems[
                                                                      index]
                                                                  .images[0]
                                                                  .src,
                                                              loadingBuilder:
                                                                  (context,
                                                                      child,
                                                                      loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return Container(
                                                                    height:
                                                                        85.h,
                                                                    width:
                                                                        100.w,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10
                                                                                .r),
                                                                        image: DecorationImage(
                                                                            image:
                                                                                NetworkImage(cartData.cartProdductItems[index].images[0].src),
                                                                            fit: BoxFit.cover)),
                                                                  );
                                                                }
                                                                return const CartImageShimmer();
                                                              },
                                                            ),
                                                            SizedBox(
                                                                width: 5.w),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  cartData
                                                                      .cartProdductItems[
                                                                          index]
                                                                      .name,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontFamily:
                                                                        GoogleFonts.poppins()
                                                                            .fontFamily,
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      AppLocale
                                                                          .cartQty
                                                                          .getString(
                                                                              context),
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontFamily:
                                                                            GoogleFonts.poppins().fontFamily,
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 10
                                                                            .w),
                                                                    IconButton(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      constraints:
                                                                          const BoxConstraints(),
                                                                      onPressed:
                                                                          () async {
                                                                        if (cartData.cartProdductItems[index].quantity -
                                                                                1 !=
                                                                            0) {
                                                                          await Provider.of<CartProvider>(context, listen: false).updateItemToCart(
                                                                              cartData.cartProdductItems[index].key,
                                                                              cartData.cartProdductItems[index].id,
                                                                              cartData.cartProdductItems[index].quantity - 1);
                                                                        } else {
                                                                          await Provider.of<CartProvider>(context, listen: false)
                                                                              .removeItemToCart(
                                                                            cartData.cartProdductItems[index].key,
                                                                          );
                                                                        }
                                                                        loadingState();
                                                                        cartFuture =
                                                                            getCartData();
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .remove_circle_outline,
                                                                        size:
                                                                            20,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 5
                                                                            .w),
                                                                    Text(
                                                                      cartData
                                                                          .cartProdductItems[
                                                                              index]
                                                                          .quantity
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontFamily:
                                                                            GoogleFonts.lexend().fontFamily,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 5
                                                                            .w),
                                                                    IconButton(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      constraints:
                                                                          const BoxConstraints(),
                                                                      onPressed:
                                                                          () async {
                                                                        await Provider.of<CartProvider>(context,
                                                                                listen: false)
                                                                            .updateItemToCart(
                                                                          cartData
                                                                              .cartProdductItems[index]
                                                                              .key,
                                                                          cartData
                                                                              .cartProdductItems[index]
                                                                              .id,
                                                                          cartData.cartProdductItems[index].quantity +
                                                                              1,
                                                                        );
                                                                        loadingState();
                                                                        cartFuture =
                                                                            getCartData();
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .add_circle_outline,
                                                                        size:
                                                                            20,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  "${AppLocale.cartPrice.getString(context)}: \$ ${(int.parse(cartData.cartProdductItems[index].prices.price) / 100).toStringAsFixed(2)}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        GoogleFonts.poppins()
                                                                            .fontFamily,
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    : Container(),
                                      )
                                    : Center(
                                        child: Text(AppLocale.noCartProductFound
                                            .getString(context)),
                                      );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 175.h,
                          width: 330.w,
                          child: Consumer<CartProvider>(
                            builder: (context, cData, _) {
                              return ListView.builder(
                                itemCount: cData.cartItems.length,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => Container(
                                  height: 175.h,
                                  width: 330.w,
                                  padding: EdgeInsets.all(10.h),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    color: Colors.blueAccent.withOpacity(0.2),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        AppLocale.totalSummary
                                            .getString(context),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocale.subTotal
                                                .getString(context),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${cartDetailsData[index].totals.currencySymbol} ${(int.parse(cartDetailsData[index].totals.totalItems) / 100).toStringAsFixed(2)}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocale.deliveryFee
                                                .getString(context),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${cartDetailsData[index].totals.currencySymbol} ${cartDetailsData[index].totals.totalFees}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocale.tax.getString(context),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${cartDetailsData[index].totals.currencySymbol} ${cartDetailsData[index].totals.totalTax}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocale.grandTotal
                                                .getString(context),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${cartDetailsData[index].totals.currencySymbol} ${(int.parse(cartDetailsData[index].totals.totalPrice) / 100).toStringAsFixed(2)}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: SizedBox(
                            height: 50.h,
                            width: 200.w,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      reverseDuration:
                                          const Duration(milliseconds: 400),
                                      child: const CheckoutScreen()),
                                  // MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const CheckoutScreen())
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              child: Text(
                                '${AppLocale.checkOutItems.getString(context)}(${cartProductData.length})',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.lexend().fontFamily,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: 150.w,
                          child: Image.asset(
                            'assets/images/empty.png',
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          AppLocale.noCartProductFound.getString(context),
                        ),
                      ],
                    ),
                  );
          });
  }
}
