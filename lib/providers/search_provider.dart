import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_assignment_app/models/products_model.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:http/http.dart' as http;

class SearchProvider extends ChangeNotifier {
  List<ProductsModel> _items = [];

  List<ProductsModel> get items {
    return [..._items];
  }

  final String? authToken;

  SearchProvider(this.authToken, this._items);

  Future submitSearch(bool isArabic, String searchedTerm, int page) async {
    String baseUrl = isArabic ? arbBaseUrl : engBaseUrl;
    final url =
        Uri.parse('$baseUrl/$midUrl/products').replace(queryParameters: {
      "search": searchedTerm,
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
        List<ProductsModel> loadedProducts = [];
        extractedData.forEach(
          (data) async {
            loadedProducts.add(
              ProductsModel(
                id: data['id'],
                title: data['name'],
                description: data['description'],
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
        _items = loadedProducts;
        notifyListeners();
        return;
      }
    } catch (error) {
      rethrow;
    }
  }

  // Future makeEmptyList() async {
  //   _items.clear();
  // }
}
