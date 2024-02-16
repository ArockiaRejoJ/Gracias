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

  List<Map<String, int>> _lineItems = [];
  List<Map<String, int>> get lineItems {
    return [..._lineItems];
  }

  CartProvider(
      this._cartItems, this._cartProdductItems, this._lineItems, this.nonceKey);

  Map<String, String> billingData = {};

  Map<String, String> shippingData = {};
  int? orderId;
  String? orderKey;
  String? orderEmail;

  // get products list for make order line items
  void getCartLineItems() {
    List<Map<String, int>> newItems = [];
    for (var cartItem in _cartProdductItems) {
      newItems.add({'product_id': cartItem.id, 'quantity': cartItem.quantity});
    }
    _lineItems = newItems;
    print('All Product List -----------------------------------------------');
    print(_lineItems);
  }

  // Remove product to cart using post method
  Future<void> removeItemToCart(String key) async {
    final url =
        Uri.parse('https://gracias.ae/wp-json/wc/store/cart/remove-item');
    try {
      final response = await http.post(
        url,
        body: {
          'key': key.toString(),
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
    } catch (error) {
      rethrow;
    }
  }

  // Update product to cart using post method
  Future<void> updateItemToCart(String key, int productId, int quantity) async {
    print(quantity);
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
          'quantity': quantity.toString(),
        },
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
          'Nonce': '$nonceKey'
        },
      );
      final extractedData = json.decode(response.body);
      found.quantity = quantity;
      print(extractedData);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  //Fetch cart items and nonceKey
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

  // add single product to cart using post method from product overview screen
  Future<void> addProductToCart(int productId, int quantity) async {
    final url = Uri.parse('https://gracias.ae/wp-json/wc/store/cart/add-item');
    try {
      final response = await http.post(
        url,
        body: {
          'id': productId.toString(),
          'quantity': quantity.toString(),
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

  // create order via post method
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
    billingData = {
      "first_name": firstName,
      "last_name": lastName,
      "address_1": address,
      "city": city,
      "state": state,
      "email": email,
      "phone": phone
    };
    shippingData = newShipping
        ? {
            'first_name': sFirstName,
            'last_name': sLastName,
            'address_1': sAddress,
            'city': sCity,
            "state": sState,
          }
        : {
            "first_name": firstName,
            "last_name": lastName,
            "address_1": address,
            "city": city,
            "state": state,
          };

    final Map<String, dynamic> orderData = {
      "line_items": _lineItems,
      "billing": billingData,
      "shipping": shippingData,
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
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Nonce': '$nonceKey'
        },
      );
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Order created successfully. Order ID: ${responseData['id']}');
        print(
            'Order created successfully. Order key: ${responseData['order_key']}');
        orderId = responseData['id'];
        orderKey = responseData['order_key'];
        orderEmail = email.toString();
        await emptyCart();
        notifyListeners();
        return;
      } else {
        print('Failed to create order. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> emptyCart() async {
    print('emptyCart in progress');
    for (var cartItem in _cartProdductItems) {
      removeItemToCart(cartItem.key);
    }
  }
}
