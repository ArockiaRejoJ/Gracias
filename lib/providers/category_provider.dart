import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/category_model.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categoryItems = [];

  List<CategoryModel> get categoryItems {
    return [..._categoryItems];
  }

  CategoryProvider(
    this._categoryItems,
  );

  Future<void> fetchProductCategory() async {
    final url =
        Uri.parse('$baseUrl/products/categories').replace(queryParameters: {
      'per_page': 100.toString(),
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
        final dynamic data = json.decode(response.body);
        print(data);

        List<CategoryModel> newCategoryData = [];
        data.forEach(
          (data) async {
            newCategoryData.add(CategoryModel(
              id: data["id"] ?? 0,
              name: data["name"] ?? "",
              slug: data["slug"] ?? "",
              parent: data["parent"] ?? 0,
              description: data["description"] ?? "",
              image: data["image"] == null
                  ? null
                  : data["image"]['src'] != false
                      ? data["image"]['src']
                      : null,
            ));
          },
        );
        if (data is List) {
        } else {
          throw Exception('Unexpected response format');
        }
        _categoryItems = newCategoryData;
        notifyListeners();
        return;
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}