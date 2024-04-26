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

  final String? authToken;
  String? nonceKey;

  List<Map<String, int>> _lineItems = [];
  List<Map<String, int>> get lineItems {
    return [..._lineItems];
  }

  CartProvider(this.authToken, this._cartItems, this._cartProdductItems,
      this._lineItems);

  Map<String, String> billingData = {};

  Map<String, String> shippingData = {};
  int? orderId;
  String? orderKey;
  String? orderEmail;

  //Fetch nonceKey
  Future fetchNonceData() async {
    final url = Uri.parse('https://gracias.ae/wp-json/wc/store/cart');
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $authToken',
      });
      final responseHeader = response.headers;
      nonceKey = responseHeader['nonce'];
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  // get products list for make order line items
  void getCartLineItems() {
    List<Map<String, int>> newItems = [];
    for (var cartItem in _cartProdductItems) {
      newItems.add({'product_id': cartItem.id, 'quantity': cartItem.quantity});
    }
    _lineItems = newItems;
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
        headers: {'Authorization': 'Bearer $authToken', 'Nonce': '$nonceKey'},
      );
      final extractedData = json.decode(response.body);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  // Update product to cart using post method
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
          'quantity': quantity.toString(),
        },
        headers: {'Authorization': 'Bearer $authToken', 'Nonce': '$nonceKey'},
      );
      final extractedData = json.decode(response.body);
      found.quantity = quantity;
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
        'Authorization': 'Bearer $authToken',
      });
      final responseHeader = response.headers;
      nonceKey = responseHeader['nonce'];
      final extractedData = json.decode(response.body);
      final data = extractedData['items'];
      if (data is List) {
        _cartProdductItems =
            data.map((item) => CartModelItem.fromJson(item)).toList();
      } else if (data is Map<String, dynamic>) {
        _cartProdductItems = [CartModelItem.fromJson(data)];
      } else {}
      if (extractedData is List) {
        _cartItems =
            extractedData.map((item) => CartModel.fromJson(item)).toList();
      } else if (extractedData is Map<String, dynamic>) {
        _cartItems = [CartModel.fromJson(extractedData)];
      } else {}
      notifyListeners();
    } catch (error) {
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
        headers: {'Authorization': 'Bearer $authToken', 'Nonce': '$nonceKey'},
      );
      final extractedData = json.decode(response.body);

      _cartProdductItems.add(CartModelItem(
        key: 'key',
        id: productId,
        quantity: quantity,
        quantityLimits: QuantityLimits(
            minimum: 1, maximum: 1, multipleOf: 1, editable: true),
        name: 'name',
        shortDescription: '',
        description: 'description',
        sku: 'sku',
        lowStockRemaining: 'lowStockRemaining',
        backordersAllowed: true,
        showBackorderBadge: true,
        soldIndividually: true,
        permalink: 'permalink',
        images: [],
        variation: [],
        itemData: [],
        prices: Prices(
            price: 'price',
            regularPrice: 'regularPrice',
            salePrice: 'salePrice',
            priceRange: 'priceRange',
            currencyCode: 'currencyCode',
            currencySymbol: 'currencySymbol',
            currencyMinorUnit: 1,
            currencyDecimalSeparator: 'currencyDecimalSeparator',
            currencyThousandSeparator: 'currencyThousandSeparator',
            currencyPrefix: 'currencyPrefix',
            currencySuffix: 'currencySuffix',
            rawPrices: RawPrices(
                precision: 1,
                price: 'price',
                regularPrice: 'regularPrice',
                salePrice: 'salePrice')),
        totals: ItemTotals(
            lineSubtotal: 'lineSubtotal',
            lineSubtotalTax: 'lineSubtotalTax',
            lineTotal: 'lineTotal',
            lineTotalTax: 'lineTotalTax',
            currencyCode: 'currencyCode',
            currencySymbol: 'currencySymbol',
            currencyMinorUnit: 1,
            currencyDecimalSeparator: 'currencyDecimalSeparator',
            currencyThousandSeparator: 'currencyThousandSeparator',
            currencyPrefix: 'currencyPrefix',
            currencySuffix: 'currencySuffix'),
        catalogVisibility: 'catalogVisibility',
        extensions: Extensions(),
      ));
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
    String userId,
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
      "customer_id": userId,
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
        },
      );
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        orderId = responseData['id'];
        orderKey = responseData['order_key'];
        orderEmail = email.toString();
        await emptyCart();

        notifyListeners();
        return;
      } else {}
    } catch (error) {
      rethrow;
    }
  }

  Future<void> emptyCart() async {
    await fetchNonceData();
    for (var cartItem in _cartProdductItems) {
      await removeItemToCart(cartItem.key);
    }
    _cartProdductItems = [];
  }
}
