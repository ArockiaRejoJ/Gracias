import 'dart:ui';

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
