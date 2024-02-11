import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({super.key});

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  @override
  Widget build(BuildContext context) {
    final cartData =
        Provider.of<CartProvider>(context, listen: false).cartProdductItems;
    final cartTotalData =
        Provider.of<CartProvider>(context, listen: false).cartItems;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 290.h,
              width: 330.w,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                color: bgColor,
              ),
              child: Consumer<CartProvider>(
                builder: (context, pData, _) {
                  return ListView.builder(
                    itemCount: cartData.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      height: 80.h,
                      width: 320.w,
                      margin: EdgeInsets.only(
                          bottom: 5.h, top: 5.h, left: 5.w, right: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        cartData[index].images[0].src),
                                    fit: BoxFit.cover)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartData[index].name),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Qty'),
                                  SizedBox(width: 10.w),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () async {
                                      await Provider.of<CartProvider>(context,
                                              listen: false)
                                          .removeItemToCart(
                                              cartData[index].id, 1);
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline,
                                      size: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    cartData[index].quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily:
                                          GoogleFonts.lexend().fontFamily,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () async {
                                      await Provider.of<CartProvider>(context,
                                              listen: false)
                                          .addItemToCart(cartData[index].id, 1);
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      size: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text("\$ ${cartData[index].prices.price}"),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40.h,
                  width: 240.w,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(color: Colors.black12, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Coupon Code',
                      contentPadding:
                          EdgeInsets.only(left: 10.w, bottom: 7.5.h),
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  height: 32.h,
                  width: 65.w,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r)),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              height: 175.h,
              width: 330.w,
              child: Consumer<CartProvider>(
                builder: (context, pData, _) {
                  return ListView.builder(
                    itemCount: cartTotalData.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      height: 175.h,
                      width: 330.w,
                      padding: EdgeInsets.all(10.h),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        color: Colors.blueAccent.withOpacity(0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Total Summary',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${cartTotalData[index].totals.currencySymbol} ${cartTotalData[index].totals.totalItems}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${cartTotalData[index].totals.currencySymbol} ${cartTotalData[index].totals.totalFees}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tax',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${cartTotalData[index].totals.currencySymbol} ${cartTotalData[index].totals.totalTax}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Grand Total',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${cartTotalData[index].totals.currencySymbol} ${cartTotalData[index].totals.totalPrice}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.sp,
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
          ],
        ),
      ),
    );
  }
}
