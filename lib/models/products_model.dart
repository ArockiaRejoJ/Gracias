import 'package:flutter/material.dart';

class ProductsModel with ChangeNotifier {
  final int? id;
  final String? title;
  final String? description;
  final String? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;

  ProductsModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
  });
}

class ProductDetails with ChangeNotifier {
  final int? id;
  final String? title;
  final String? description;
  final String? price;
  int? quantity;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;

  ProductDetails({
    this.id,
    this.title,
    this.description,
    this.price,
    this.quantity,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
  });
}
