import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/products_model.dart';
import 'package:flutter_assignment_app/providers/search_provider.dart';
import 'package:flutter_assignment_app/widgets/product_container.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchResultsWidget extends StatefulWidget {
  final String? searchedTerm;

  const SearchResultsWidget(this.searchedTerm, {Key? key}) : super(key: key);

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final ScrollController _scrollController = ScrollController();
  final int _perPage = 10; // Number of products to load per page
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadProducts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadProducts() async {
    if (_isLoading || !_hasMoreData) {
      return;
    }
    setState(() {
      _isLoading = true;
    });

    // Fetch products for the current page
    try {
      final productProvider =
          Provider.of<SearchProvider>(context, listen: false);
      await productProvider.submitSearch(
          _localization.currentLocale == const Locale("en", "US")
              ? false
              : true,
          widget.searchedTerm!,
          _currentPage);
      _currentPage++; // Increment current page after fetching data
    } catch (error) {
      // Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has scrolled to the end of the list
      _loadProducts();
    }
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
        ? const Center(child: Text('No Products Found'))
        : GridView.builder(
            controller: _scrollController,
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
