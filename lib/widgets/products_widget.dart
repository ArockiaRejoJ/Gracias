import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/product_provider.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_assignment_app/widgets/loading_widget.dart';
import 'package:flutter_assignment_app/widgets/product_container.dart';
import 'package:flutter_assignment_app/widgets/product_loading.dart';
import 'package:flutter_assignment_app/widgets/shimmer_widget.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductsWidget extends StatefulWidget {
  final bool isArabic;
  const ProductsWidget(this.isArabic, {super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  Future? _productFuture;

  Future getProductData() async {
    return await Provider.of<ProductProvider>(context, listen: false)
        .fetchProduct(widget.isArabic, 1);
  }

  @override
  void initState() {
    _productFuture = getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context).productItems;
    return FutureBuilder(
      future: _productFuture,
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return const ProductLoadingWidget();
        } else {
          if (dataSnapshot.error != null) {
            return Center(
              child: Text(
                AppLocale.apiErrorText.getString(context),
              ),
            );
          } else {
            return Consumer<ProductProvider>(
              builder: (context, pData, _) {
                return GridView.builder(
                  padding: EdgeInsets.all(10.h),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 10.h,
                    mainAxisExtent: 200.h,
                  ),
                  itemCount: productData.length,
                  itemBuilder: (_, index) => ProductContainerWidget(
                    id: productData[index].id,
                    title: productData[index].title,
                    image: productData[index].thumbnail!,
                    price: productData[index].price!,
                    description: productData[index].description!,
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
