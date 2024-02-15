import 'package:flutter/material.dart';

class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? userName;
  final String? password;
  final String? email;
  final String? imageUrl;
  BillingAddress billingData;

  ShippingAddress shippingData;
  UserModel(
    this.id,
    this.firstName,
    this.lastName,
    this.role,
    this.userName,
    this.password,
    this.email,
    this.imageUrl,
    this.billingData,
    this.shippingData,
  );
}

class BillingAddress {
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? city;
  final String? state;
  final String? email;
  final String? phoneNumber;

  BillingAddress(
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.state,
    this.email,
    this.phoneNumber,
  );
}

class ShippingAddress {
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? city;
  final String? state;

  ShippingAddress(
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.state,
  );
}
