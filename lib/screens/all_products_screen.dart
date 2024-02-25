import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/products_model.dart';
import 'package:flutter_assignment_app/providers/cart_provider.dart';
import 'package:flutter_assignment_app/providers/product_provider.dart';
import 'package:flutter_assignment_app/screens/home_screen.dart';
import 'package:flutter_assignment_app/utils/transilation_words.dart';
import 'package:flutter_assignment_app/widgets/loading_widget.dart';
import 'package:flutter_assignment_app/widgets/product_container.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
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
          Provider.of<ProductProvider>(context, listen: false);
      await productProvider.fetchAllProduct(false, _currentPage);
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
    final productData = Provider.of<ProductProvider>(context).allProductItems;

    return Directionality(
      textDirection: _localization.currentLocale == const Locale("en", "US")
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocale.productTitle.getString(context),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Stack(
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
      ),
    );
  }

  Widget _buildProductList(List<ProductsModel> productData) {
    return GridView.builder(
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
