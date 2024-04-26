import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/order_provider.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_assignment_app/widgets/loading_widget.dart';
import 'package:flutter_assignment_app/widgets/shimmer_widget.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  final String userId;
  const OrdersScreen(this.userId, {super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  Future? _orderFuture;

  Future getOrdersData() async {
    return await Provider.of<OrderProvider>(context, listen: false)
        .fetchOrderData(widget.userId);
  }

  @override
  void initState() {
    _orderFuture = getOrdersData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context).orderItems;
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocale.myOrders.getString(context),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: _orderFuture,
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget(200, 360);
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text(AppLocale.apiErrorText.getString(context)),
                );
              } else {
                return Consumer<OrderProvider>(
                  builder: (context, ordersData, _) {
                    return orderData.isEmpty
                        ? Center(
                            child:
                                Text(AppLocale.noOrderFound.getString(context)),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.all(10.h),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: orderData.length,
                            itemBuilder: (_, index) => Container(
                              height: 350.h,
                              width: 340.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              margin: EdgeInsets.only(bottom: 10.h),
                              padding: EdgeInsets.all(10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              '${AppLocale.order.getString(context)} : ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily:
                                                GoogleFonts.lexend().fontFamily,
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "#${orderData[index].id}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: GoogleFonts.lexend()
                                                    .fontFamily,
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text:
                                                '${AppLocale.status.getString(context)} : ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: GoogleFonts.lexend()
                                                  .fontFamily,
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: orderData[index].status,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text:
                                            '${AppLocale.billingAddress.getString(context)} : ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily:
                                              GoogleFonts.lexend().fontFamily,
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                "\n${orderData[index].billing.firstName} ${orderData[index].billing.lastName},${orderData[index].billing.address1},\n${orderData[index].billing.city},${orderData[index].billing.state}, \nPhone: ${orderData[index].billing.phone}, \nEmail: ${orderData[index].billing.email}.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: GoogleFonts.lexend()
                                                    .fontFamily,
                                                fontSize: 12.sp,
                                                color: Colors.black),
                                          )
                                        ]),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${AppLocale.shippingAddress.getString(context)} : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            GoogleFonts.lexend().fontFamily,
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "\n${orderData[index].shipping.firstName} ${orderData[index].shipping.lastName},${orderData[index].shipping.address1},\n${orderData[index].shipping.city},${orderData[index].shipping.state}. ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily:
                                                GoogleFonts.lexend().fontFamily,
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          orderData[index].lineItems.length,
                                      itemBuilder: (context, _) => Container(
                                        height: 80.h,
                                        width: 320.w,
                                        margin: EdgeInsets.only(
                                            bottom: 5.h,
                                            top: 5.h,
                                            left: 5.w,
                                            right: 5.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: Colors.white),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              orderData[index]
                                                  .lineItems[_]
                                                  .image
                                                  .src,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return Container(
                                                    height: 80.h,
                                                    width: 100.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                orderData[index]
                                                                    .lineItems[
                                                                        _]
                                                                    .image
                                                                    .src),
                                                            fit: BoxFit.cover)),
                                                  );
                                                }
                                                return const CartImageShimmer();
                                              },
                                            ),
                                            SizedBox(width: 5.w),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  orderData[index]
                                                      .lineItems[_]
                                                      .name,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 16.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      AppLocale.cartQty
                                                          .getString(context),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily,
                                                        fontSize: 16.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    Text(
                                                      orderData[index]
                                                          .lineItems[_]
                                                          .quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontFamily:
                                                            GoogleFonts.lexend()
                                                                .fontFamily,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "${AppLocale.cartPrice.getString(context)}: \$ ${orderData[index].lineItems[_].price}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontSize: 16.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
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
}
