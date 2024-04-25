import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const bgColor = Color(0xFFead4e1);

const fontColor = Color(0xFF5e5e5e);

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}

Color shimmerBgColor = Colors.grey.shade300;
Color shimmerShadowColor = Colors.grey.shade100;

