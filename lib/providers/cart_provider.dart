import 'dart:convert';
import 'package:flutter/cupertino.dart';
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
    notifyListeners();

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
          'Nonce': '8f8ef70940'
        },
      );
      final extractedData = json.decode(response.body);
      found.quantity = found.quantity + 1;
      print(extractedData);
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
      } else if (extractedData is Map<String, dynamic>) {
        _cartItems = [CartModel.fromJson(extractedData)];
      } else {
        print('Unexpected response format');
      }
      notifyListeners();
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
