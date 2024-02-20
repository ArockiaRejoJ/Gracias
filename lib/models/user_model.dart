// import 'package:flutter/material.dart';
//
// class UserModel with ChangeNotifier {
//   final int? id;
//   final String? firstName;
//   final String? lastName;
//   final String? emailId;
//   final String? token;
//   final String? userName;
//   final String? image;
//   BillingAddress? billingAddress;
//   ShippingAddress? shippingAddress;
//
//   UserModel(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.emailId,
//       this.token,
//       this.userName,
//       this.image,
//       this.billingAddress,
//       this.shippingAddress});
// }
//
// class BillingAddress {
//   String? firstname;
//   String? lastName;
//   String? address1;
//   String? city;
//   String? state;
//   String? email;
//   String? phone;
//
//   BillingAddress(
//     this.firstname,
//     this.lastName,
//     this.address1,
//     this.city,
//     this.state,
//     this.email,
//     this.phone,
//   );
// }
//
// class ShippingAddress {
//   String? firstname;
//   String? lastName;
//   String? address1;
//   String? city;
//   String? state;
//
//   ShippingAddress(
//     this.firstname,
//     this.lastName,
//     this.address1,
//     this.city,
//     this.state,
//   );
// }

class UserModel {
  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String email;
  String firstName;
  String lastName;
  String role;
  String username;
  Ing billing;
  Ing shipping;

  UserModel({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.username,
    required this.billing,
    required this.shipping,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["role"],
        username: json["username"],
        billing: Ing.fromJson(json["billing"]),
        shipping: Ing.fromJson(json["shipping"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "role": role,
        "username": username,
        "billing": billing.toJson(),
        "shipping": shipping.toJson(),
      };
}

class Ing {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String postcode;
  String country;
  String state;
  String? email;
  String phone;

  Ing({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.postcode,
    required this.country,
    required this.state,
    this.email,
    required this.phone,
  });

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        postcode: json["postcode"],
        country: json["country"],
        state: json["state"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "postcode": postcode,
        "country": country,
        "state": state,
        "email": email,
        "phone": phone,
      };
}
