import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/products_model.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  List<ProductsModel> _productItems = [];

  List<ProductsModel> get productItems {
    return [..._productItems];
  }

  List<ProductDetails> _productDetailsById = [];

  List<ProductDetails> get productDetailsById {
    return [..._productDetailsById];
  }
  //
  // List<ProductsModel> _productByCategoryById = [];
  //
  // List<ProductsModel> get productByCategoryById {
  //   return [..._productByCategoryById];
  // }

  ProductProvider(
    this._productItems,
    this._productDetailsById,
    // this._productByCategoryById
  );

  Future<void> fetchProduct(bool isArabic) async {
    String baseUrl = isArabic ? arbBaseUrl : engBaseUrl;
    print('base Url : $baseUrl');
    final url = Uri.parse('$baseUrl/$midUrl/products');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
        },
      );

      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        print(extractedData);
        List<ProductsModel> newProductData = [];
        extractedData.forEach(
          (data) async {
            newProductData.add(
              ProductsModel(
                id: data['id'],
                title: data['name'],
                description: data['description'],
                price: data['price'].toString(),
                discountPercentage: 5,
                rating: double.parse(data['average_rating']),
                stock: data['stock_status'] == 'instock' ? 1 : 0,
                brand: 'NO DATA',
                category: data['category'] != null
                    ? data['category'][0]['slug']
                    : 'NO DATA',
                thumbnail: data['images'] != []
                    ? data['images'][0] != []
                        ? data['images'][0]['src']
                        : 'https://gracias.ae/wp-content/uploads/2024/01/Grasias-Logo-2-01-1024x654.png'
                    : 'https://gracias.ae/wp-content/uploads/2024/01/Grasias-Logo-2-01-1024x654.png',
              ),
            );
          },
        );
        _productItems = newProductData;
        notifyListeners();
        return;
      }
    } catch (error) {
      rethrow;
    }
  }

}
