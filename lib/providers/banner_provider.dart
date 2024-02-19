import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/banner_model.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:http/http.dart' as http;

class BannerProvider with ChangeNotifier {
  List<BannerModel> _bannerItems = [];

  List<BannerModel> get bannerItems {
    return [..._bannerItems];
  }

  BannerProvider(
    this._bannerItems,
  );

  Future<void> fetchBannerData(bool isArabic) async {
    String baseUrl = isArabic ? arbBaseUrl : engBaseUrl;
    final url =
        Uri.parse('$baseUrl/wp-json/wp/v2/media').replace(queryParameters: {
      'search': 'banner',
      '_fields[]': ['id', 'guid.rendered'],
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
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        print(data);

        List<BannerModel> newBannerData = [];
        data.forEach(
          (data) async {
            newBannerData.add(
              BannerModel(
                id: data["id"],
                image: data["guid"] == null
                    ? null
                    : data["guid"]['rendered'] != false
                        ? data["guid"]['rendered']
                        : null,
              ),
            );
          },
        );
        if (data is List) {
        } else {
          throw Exception('Unexpected response format');
        }
        _bannerItems = newBannerData;
        notifyListeners();
        return;
      }
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
