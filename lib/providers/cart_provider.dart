import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_assignment_app/utils/key_details.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartItems = [];

  List<CartModel> get cartItems {
    return [..._cartItems];
  }

  List<CartModelItem> _cartProdductItems = [];

  List<CartModelItem> get cartProdductItems {
    return [..._cartProdductItems];
  }

  String? nonceKey;

  CartProvider(this._cartItems, this._cartProdductItems);

// add single product to cart using post method
  Future<void> addItemToCart(int productId, int quantity) async {
    var found = _cartProdductItems.firstWhere(
      (element) => element.id == productId,
    );

    final url = Uri.parse('https://gracias.ae/wp-json/wc/store/cart/add-item');
    try {
      final response = await http.post(
        url,
        body: {
          'id': productId.toString(),
          'product_details_id': quantity.toString(),
        },
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
          'Nonce': '$nonceKey'
        },
      );
      final extractedData = json.decode(response.body);
      found.quantity = found.quantity + 1;
      print(extractedData);
      notifyListeners();
      return;
    } catch (error) {
      rethrow;
    }
  }

  // Remove single product to cart using post method
  Future<void> removeItemToCart(String key, int productId, int quantity) async {
    var found = _cartProdductItems.firstWhere(
      (element) => element.id == productId,
    );

    final url =
        Uri.parse('https://gracias.ae/wp-json/wc/store/cart/remove-item');
    try {
      final response = await http.post(
        url,
        body: {
          'key': key.toString(),
          'id': productId.toString(),
          'product_details_id': quantity.toString(),
        },
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
          'Nonce': '$nonceKey'
        },
      );
      final extractedData = json.decode(response.body);
      found.quantity = found.quantity - 1;
      print(extractedData);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  // add single product to cart using post method
  Future<void> updateItemToCart(String key, int productId, int quantity) async {
    var found = _cartProdductItems.firstWhere(
      (element) => element.id == productId,
    );

    final url =
        Uri.parse('https://gracias.ae/wp-json/wc/store/cart/update-item');
    try {
      final response = await http.post(
        url,
        body: {
          'key': key.toString(),
          'id': productId.toString(),
          'product_details_id': quantity.toString(),
        },
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
          'Nonce': '$nonceKey'
        },
      );
      final extractedData = json.decode(response.body);
      found.quantity = found.quantity + 1;
      print(extractedData);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  //Fetch cart items
  Future<void> fetchData() async {
    final url = Uri.parse('https://gracias.ae/wp-json/wc/store/cart');
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
      });
      final responseHeader = response.headers;
      nonceKey = responseHeader['nonce'];
      print('Nonce key : $nonceKey');
      final extractedData = json.decode(response.body);
      final data = extractedData['items'];
      if (data is List) {
        _cartProdductItems =
            data.map((item) => CartModelItem.fromJson(item)).toList();
      } else if (data is Map<String, dynamic>) {
        _cartProdductItems = [CartModelItem.fromJson(data)];
      } else {
        print('Unexpected response format');
      }
      if (extractedData is List) {
        _cartItems =
            extractedData.map((item) => CartModel.fromJson(item)).toList();
        print('data fetched in if');
      } else if (extractedData is Map<String, dynamic>) {
        _cartItems = [CartModel.fromJson(extractedData)];
        print('data fetched in else part');
      } else {
        print('Unexpected response format');
      }
      notifyListeners();
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  // //Fetch cart items
  // Future<void> updateCartData() async {
  //   final url = Uri.parse('https://gracias.ae/wp-json/wc/store/cart');
  //   try {
  //     final response = await http.get(url, headers: {
  //       'Authorization':
  //           'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
  //     });
  //     final extractedData = json.decode(response.body);
  //     print(extractedData);
  //     _cartItems = [];
  //     if (extractedData is Map<String, dynamic>) {
  //       _cartItems = [CartModel.fromJson(extractedData)];
  //       print('cart update done');
  //     } else {
  //       print('Unexpected response format');
  //     }
  //     notifyListeners();
  //   } catch (error) {
  //     print(error);
  //     rethrow;
  //   }
  // }

  // add single product to cart using post method
  Future<void> addProductToCart(int productId, int quantity) async {
    final url = Uri.parse('https://gracias.ae/wp-json/wc/store/cart/add-item');
    try {
      final response = await http.post(
        url,
        body: {
          'id': productId.toString(),
          'product_details_id': quantity.toString(),
        },
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
          'Nonce': '$nonceKey'
        },
      );
      final extractedData = json.decode(response.body);
      print(extractedData);
      notifyListeners();
      return;
    } catch (error) {
      rethrow;
    }
  }

  // add single product to cart using post method
  Future<void> createOrder(
    String firstName,
    String lastName,
    String address,
    String city,
    String state,
    String phone,
    String email,
    bool newShipping,
    String sFirstName,
    String sLastName,
    String sAddress,
    String sCity,
    String sState,
  ) async {
    final url = Uri.parse('https://gracias.ae/wp-json/wc/v3/orders');

    final Map<String, dynamic> orderData = {
      "line_items": [
        {"product_id": 1467, "quantity": 1},
        {"product_id": 1368, "quantity": 1},
        {"product_id": 1358, "quantity": 1}
      ],
      "billing": {
        "first_name": "data",
        "last_name": "data",
        "address_1": "data",
        "city": "data",
        "state": "data",
        "email": "test@gmail.com",
        "phone": "0567363749"
      },
      "shipping": {
        "first_name": "data",
        "last_name": "data",
        "address_1": "data",
        "city": "data",
        "state": "data",
      },
      "payment_method": "cod",
      "payment_method_title": "Cash On Delivery",
      "status": "pending",
      "meta_data": [],
      "tax_lines": [],
      "shipping_lines": [],
      "fee_lines": [],
      "coupon_lines": []
    };
    try {
      final response = await http.post(
        url,
        body: jsonEncode(orderData),
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
          'Nonce': '$nonceKey'
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Order created successfully. Order ID: ${responseData['id']}');
      } else {
        print('Failed to create order. Status code: ${response.statusCode}');

        print('Response body: ${response.body}');
      }
      notifyListeners();
      return;
    } catch (error) {
      rethrow;
    }
  }
}
