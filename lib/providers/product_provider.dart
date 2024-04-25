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

  List<ProductsModel> _productByCategoryById = [];

  List<ProductsModel> get productByCategoryById {
    return [..._productByCategoryById];
  }

  List<ProductsModel> _allProductItems = [];

  List<ProductsModel> get allProductItems {
    return [..._allProductItems];
  }

  final String? authToken;

  ProductProvider(
    this.authToken,
    this._productItems,
    this._productByCategoryById,
    this._allProductItems,
  );

  Future<void> fetchProduct(bool isArabic, int page) async {
    String baseUrl = isArabic ? arbBaseUrl : engBaseUrl;
    final url =
        Uri.parse('$baseUrl/$midUrl/products').replace(queryParameters: {
      'order': 'asc',
      'page': page.toString(),
      'per_page': 10.toString(),
    });

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
        List<ProductsModel> newProductData = [];
        extractedData.forEach(
          (data) async {
            newProductData.add(
              ProductsModel(
                id: data['id'],
                title: data['name'],
                description: data['description']
                    .replaceAll("<p>", "")
                    .replaceAll("\"", "")
                    .replaceAll("!</p>", "")
                    .replaceAll("</p>", "")
                    .replaceAll(".</p>", "")
                    .replaceAll("<br />", ""),
                price: data['price'].toString(),
                discountPercentage: 5,
                rating: double.parse(data['average_rating']),
                stock: data['stock_status'] == 'instock' ? 1 : 0,
                brand: 'NO DATA',
                category:
                    data['category'] != null ? data['category'][0]['id'] : null,
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

  Future<void> fetchCategoryProduct(bool isArabic, int page, int id) async {
    String baseUrl = isArabic ? arbBaseUrl : engBaseUrl;
    final url =
        Uri.parse('$baseUrl/$midUrl/products').replace(queryParameters: {
      'category': id.toString(),
      'page': page.toString(),
      'per_page': 50.toString(),
    });

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
        List<ProductsModel> newProductData = [];
        extractedData.forEach(
          (data) async {
            newProductData.add(
              ProductsModel(
                id: data['id'],
                title: data['name'],
                description: data['description']
                    .replaceAll("<p>", "")
                    .replaceAll("\"", "")
                    .replaceAll("!</p>", "")
                    .replaceAll("</p>", "")
                    .replaceAll(".</p>", "")
                    .replaceAll("<br />", ""),
                price: data['price'].toString(),
                discountPercentage: 5,
                rating: double.parse(data['average_rating']),
                stock: data['stock_status'] == 'inStock' ? 1 : 0,
                brand: 'NO DATA',
                category:
                    data['category'] != null ? data['category'][0]['id'] : null,
                thumbnail: data['images'] != []
                    ? data['images'][0] != []
                        ? data['images'][0]['src']
                        : 'https://gracias.ae/wp-content/uploads/2024/01/Grasias-Logo-2-01-1024x654.png'
                    : 'https://gracias.ae/wp-content/uploads/2024/01/Grasias-Logo-2-01-1024x654.png',
              ),
            );
          },
        );
        _productByCategoryById = newProductData;
        notifyListeners();
        return;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchAllProduct(bool isArabic, int page) async {
    String baseUrl = isArabic ? arbBaseUrl : engBaseUrl;
    final url =
        Uri.parse('$baseUrl/$midUrl/products').replace(queryParameters: {
      'order': 'asc',
      'page': page.toString(),
      'per_page': 10.toString(),
    });

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
        extractedData.forEach(
          (data) async {
            _allProductItems.add(
              ProductsModel(
                id: data['id'],
                title: data['name'],
                description: data['description']
                    .replaceAll("<p>", "")
                    .replaceAll("\"", "")
                    .replaceAll("!</p>", "")
                    .replaceAll("</p>", "")
                    .replaceAll(".</p>", "")
                    .replaceAll("<br />", ""),
                price: data['price'].toString(),
                discountPercentage: 5,
                rating: double.parse(data['average_rating']),
                stock: data['stock_status'] == 'instock' ? 1 : 0,
                brand: 'NO DATA',
                category:
                    data['category'] != null ? data['category'][0]['id'] : null,
                thumbnail: data['images'] != []
                    ? data['images'][0] != []
                        ? data['images'][0]['src']
                        : 'https://gracias.ae/wp-content/uploads/2024/01/Grasias-Logo-2-01-1024x654.png'
                    : 'https://gracias.ae/wp-content/uploads/2024/01/Grasias-Logo-2-01-1024x654.png',
              ),
            );
          },
        );
        notifyListeners();
        return;
      }
    } catch (error) {
      rethrow;
    }
  }
}
