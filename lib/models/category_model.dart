import 'package:flutter/material.dart';

class CategoryModel with ChangeNotifier {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? image;
  CategoryModel(
      {this.id,
      this.name,
      this.slug,
      this.parent,
      this.description,
      this.image});
}
