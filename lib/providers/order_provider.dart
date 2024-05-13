import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/models/order_model.dart';
import 'package:flutter_assignment_app/utils/key_details.dart';
import 'package:http/http.dart' as http;

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orderItems = [];

  List<OrderModel> get orderItems {
    return [..._orderItems];
  }

  final String? authToken;
  OrderProvider(this.authToken, this._orderItems);

  //Fetch cart items
  Future<void> fetchOrderData(String userId) async {
    final url = Uri.parse('https://gracias.ae/wp-json/wc/v3/orders')
        .replace(queryParameters: {
      'order': 'asc',
      'customer': userId,
      'page': 1.toString(),
      'per_page': 100.toString(),
    });
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      final extractedData = json.decode(response.body);

      if (extractedData is List) {
        _orderItems =
            extractedData.map((item) => OrderModel.fromJson(item)).toList();
      } else if (extractedData is Map<String, dynamic>) {
        _orderItems = [OrderModel.fromJson(extractedData)];
      } else {
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
