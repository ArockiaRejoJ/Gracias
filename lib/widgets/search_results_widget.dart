import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/products_model.dart';
import 'package:flutter_assignment_app/providers/search_provider.dart';
import 'package:flutter_assignment_app/widgets/product_container.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/transilation_words.dart';

class SearchResultsWidget extends StatefulWidget {
  final String? searchedTerm;

  const SearchResultsWidget(this.searchedTerm, {Key? key}) : super(key: key);

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<SearchProvider>(context).items;
    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Stack(
        children: [
          _buildProductList(productData),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildProductList(List<ProductsModel> productData) {
    return productData.isEmpty && _isLoading == false
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
                Text(AppLocale.noProductsFound.getString(context)),
              ],
            ),
          )
        : GridView.builder(
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 20.h),
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
  }
}
