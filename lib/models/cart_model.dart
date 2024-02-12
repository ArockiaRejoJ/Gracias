// import 'package:flutter/cupertino.dart';
//
// class CartModel with ChangeNotifier {
//   List<CartModelItem> items;
//   List<Coupon> coupons;
//   List<dynamic> fees;
//   CartModelTotals totals;
//   IngAddress shippingAddress;
//   IngAddress billingAddress;
//   bool needsPayment;
//   bool needsShipping;
//   List<String> paymentRequirements;
//   bool hasCalculatedShipping;
//   List<CartModelShippingRate> shippingRates;
//   int itemsCount;
//   int itemsWeight;
//   List<dynamic> crossSells;
//   List<dynamic> errors;
//   List<String> paymentMethods;
//   Extensions extensions;
//
//   CartModel({
//     required this.items,
//     required this.coupons,
//     required this.fees,
//     required this.totals,
//     required this.shippingAddress,
//     required this.billingAddress,
//     required this.needsPayment,
//     required this.needsShipping,
//     required this.paymentRequirements,
//     required this.hasCalculatedShipping,
//     required this.shippingRates,
//     required this.itemsCount,
//     required this.itemsWeight,
//     required this.crossSells,
//     required this.errors,
//     required this.paymentMethods,
//     required this.extensions,
//   });
//
//   factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
//         items: List<CartModelItem>.from(
//             json["items"].map((x) => CartModelItem.fromJson(x))),
//         coupons:
//             List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
//         fees: List<dynamic>.from(json["fees"].map((x) => x)),
//         totals: CartModelTotals.fromJson(json["totals"]),
//         shippingAddress: IngAddress.fromJson(json["shipping_address"]),
//         billingAddress: IngAddress.fromJson(json["billing_address"]),
//         needsPayment: json["needs_payment"],
//         needsShipping: json["needs_shipping"],
//         paymentRequirements:
//             List<String>.from(json["payment_requirements"].map((x) => x)),
//         hasCalculatedShipping: json["has_calculated_shipping"],
//         shippingRates: List<CartModelShippingRate>.from(json["shipping_rates"]
//             .map((x) => CartModelShippingRate.fromJson(x))),
//         itemsCount: json["items_count"],
//         itemsWeight: json["items_weight"],
//         crossSells: List<dynamic>.from(json["cross_sells"].map((x) => x)),
//         errors: List<dynamic>.from(json["errors"].map((x) => x)),
//         paymentMethods:
//             List<String>.from(json["payment_methods"].map((x) => x)),
//         extensions: Extensions.fromJson(json["extensions"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//         "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
//         "fees": List<dynamic>.from(fees.map((x) => x)),
//         "totals": totals.toJson(),
//         "shipping_address": shippingAddress.toJson(),
//         "billing_address": billingAddress.toJson(),
//         "needs_payment": needsPayment,
//         "needs_shipping": needsShipping,
//         "payment_requirements":
//             List<dynamic>.from(paymentRequirements.map((x) => x)),
//         "has_calculated_shipping": hasCalculatedShipping,
//         "shipping_rates":
//             List<dynamic>.from(shippingRates.map((x) => x.toJson())),
//         "items_count": itemsCount,
//         "items_weight": itemsWeight,
//         "cross_sells": List<dynamic>.from(crossSells.map((x) => x)),
//         "errors": List<dynamic>.from(errors.map((x) => x)),
//         "payment_methods": List<dynamic>.from(paymentMethods.map((x) => x)),
//         "extensions": extensions.toJson(),
//       };
// }
//
// class IngAddress {
//   String firstName;
//   String lastName;
//   String company;
//   String address1;
//   String address2;
//   String city;
//   String state;
//   String postcode;
//   String country;
//   String? email;
//   String phone;
//
//   IngAddress({
//     required this.firstName,
//     required this.lastName,
//     required this.company,
//     required this.address1,
//     required this.address2,
//     required this.city,
//     required this.state,
//     required this.postcode,
//     required this.country,
//     this.email,
//     required this.phone,
//   });
//
//   factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         company: json["company"],
//         address1: json["address_1"],
//         address2: json["address_2"],
//         city: json["city"],
//         state: json["state"],
//         postcode: json["postcode"],
//         country: json["country"],
//         email: json["email"],
//         phone: json["phone"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "first_name": firstName,
//         "last_name": lastName,
//         "company": company,
//         "address_1": address1,
//         "address_2": address2,
//         "city": city,
//         "state": state,
//         "postcode": postcode,
//         "country": country,
//         "email": email,
//         "phone": phone,
//       };
// }
//
// class Coupon {
//   String code;
//   String discountType;
//   CouponTotals totals;
//
//   Coupon({
//     required this.code,
//     required this.discountType,
//     required this.totals,
//   });
//
//   factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
//         code: json["code"],
//         discountType: json["discount_type"],
//         totals: CouponTotals.fromJson(json["totals"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "discount_type": discountType,
//         "totals": totals.toJson(),
//       };
// }
//
// class CouponTotals {
//   String totalDiscount;
//   String totalDiscountTax;
//   String currencyCode;
//   String currencySymbol;
//   int currencyMinorUnit;
//   String currencyDecimalSeparator;
//   String currencyThousandSeparator;
//   String currencyPrefix;
//   String currencySuffix;
//
//   CouponTotals({
//     required this.totalDiscount,
//     required this.totalDiscountTax,
//     required this.currencyCode,
//     required this.currencySymbol,
//     required this.currencyMinorUnit,
//     required this.currencyDecimalSeparator,
//     required this.currencyThousandSeparator,
//     required this.currencyPrefix,
//     required this.currencySuffix,
//   });
//
//   factory CouponTotals.fromJson(Map<String, dynamic> json) => CouponTotals(
//         totalDiscount: json["total_discount"],
//         totalDiscountTax: json["total_discount_tax"],
//         currencyCode: json["currency_code"],
//         currencySymbol: json["currency_symbol"],
//         currencyMinorUnit: json["currency_minor_unit"],
//         currencyDecimalSeparator: json["currency_decimal_separator"],
//         currencyThousandSeparator: json["currency_thousand_separator"],
//         currencyPrefix: json["currency_prefix"],
//         currencySuffix: json["currency_suffix"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "total_discount": totalDiscount,
//         "total_discount_tax": totalDiscountTax,
//         "currency_code": currencyCode,
//         "currency_symbol": currencySymbol,
//         "currency_minor_unit": currencyMinorUnit,
//         "currency_decimal_separator": currencyDecimalSeparator,
//         "currency_thousand_separator": currencyThousandSeparator,
//         "currency_prefix": currencyPrefix,
//         "currency_suffix": currencySuffix,
//       };
// }
//
// class Extensions {
//   Extensions();
//
//   factory Extensions.fromJson(Map<String, dynamic> json) => Extensions();
//
//   Map<String, dynamic> toJson() => {};
// }
//
// class CartModelItem {
//   String key;
//   int id;
//   int quantity;
//   // QuantityLimits? quantityLimits;
//   String name;
//   String shortDescription;
//   String description;
//   String sku;
//   dynamic lowStockRemaining;
//   bool backordersAllowed;
//   bool showBackorderBadge;
//   bool soldIndividually;
//   String permalink;
//   String images;
//   // List<dynamic> variation;
//   // List<dynamic> itemData;
//   String prices;
//   String totals;
//   // String catalogVisibility;
//   // Extensions extensions;
//
//   CartModelItem({
//     required this.key,
//     required this.id,
//     required this.quantity,
//     // this.quantityLimits,
//     required this.name,
//     required this.shortDescription,
//     required this.description,
//     required this.sku,
//     required this.lowStockRemaining,
//     required this.backordersAllowed,
//     required this.showBackorderBadge,
//     required this.soldIndividually,
//     required this.permalink,
//     required this.images,
//     // required this.variation,
//     // required this.itemData,
//     required this.prices,
//     required this.totals,
//     // required this.catalogVisibility,
//     // required this.extensions,
//   });
//
//   factory CartModelItem.fromJson(Map<String, dynamic> json) => CartModelItem(
//         key: json["key"],
//         id: json["id"],
//         quantity: json["quantity"],
//         //quantityLimits: QuantityLimits.fromJson(json["quantity_limits"]),
//         name: json["name"],
//         shortDescription: json["short_description"],
//         description: json["description"],
//         sku: json["sku"],
//         lowStockRemaining: json["low_stock_remaining"],
//         backordersAllowed: json["backorders_allowed"],
//         showBackorderBadge: json["show_backorder_badge"],
//         soldIndividually: json["sold_individually"],
//         permalink: json["permalink"],
//         images: json["images"],
//         //List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//         // variation: List<dynamic>.from(json["variation"].map((x) => x)),
//         // itemData: List<dynamic>.from(json["item_data"].map((x) => x)),
//         prices: json["prices"],
//         //Prices.fromJson(json["prices"]),
//         totals: json["totals"],
//         // ItemTotals.fromJson(json["totals"]),
//         // catalogVisibility: json["catalog_visibility"],
//         // extensions: Extensions.fromJson(json["extensions"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "key": key,
//         "id": id,
//         "quantity": quantity,
//         // "quantity_limits": quantityLimits.toJson(),
//         "name": name,
//         "short_description": shortDescription,
//         "description": description,
//         "sku": sku,
//         "low_stock_remaining": lowStockRemaining,
//         "backorders_allowed": backordersAllowed,
//         "show_backorder_badge": showBackorderBadge,
//         "sold_individually": soldIndividually,
//         "permalink": permalink,
//         "images": images.toString(),
//         //List<dynamic>.from(images.map((x) => x.toJson())),
//         // "variation": List<dynamic>.from(variation.map((x) => x)),
//         // "item_data": List<dynamic>.from(itemData.map((x) => x)),
//         "prices": prices.toString(),
//         "totals": totals.toString(),
//         // "catalog_visibility": catalogVisibility,
//         // "extensions": extensions.toJson(),
//       };
// }
//
// class Image {
//   int id;
//   String src;
//   String thumbnail;
//   String srcset;
//   String sizes;
//   String name;
//   String alt;
//
//   Image({
//     required this.id,
//     required this.src,
//     required this.thumbnail,
//     required this.srcset,
//     required this.sizes,
//     required this.name,
//     required this.alt,
//   });
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"],
//         src: json["src"],
//         thumbnail: json["thumbnail"],
//         srcset: json["srcset"],
//         sizes: json["sizes"],
//         name: json["name"],
//         alt: json["alt"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "src": src,
//         "thumbnail": thumbnail,
//         "srcset": srcset,
//         "sizes": sizes,
//         "name": name,
//         "alt": alt,
//       };
// }
//
// class Prices {
//   String price;
//   String regularPrice;
//   String salePrice;
//   dynamic priceRange;
//   String currencyCode;
//   String currencySymbol;
//   int currencyMinorUnit;
//   String currencyDecimalSeparator;
//   String currencyThousandSeparator;
//   String currencyPrefix;
//   String currencySuffix;
//   RawPrices rawPrices;
//
//   Prices({
//     required this.price,
//     required this.regularPrice,
//     required this.salePrice,
//     required this.priceRange,
//     required this.currencyCode,
//     required this.currencySymbol,
//     required this.currencyMinorUnit,
//     required this.currencyDecimalSeparator,
//     required this.currencyThousandSeparator,
//     required this.currencyPrefix,
//     required this.currencySuffix,
//     required this.rawPrices,
//   });
//
//   factory Prices.fromJson(Map<String, dynamic> json) => Prices(
//         price: json["price"],
//         regularPrice: json["regular_price"],
//         salePrice: json["sale_price"],
//         priceRange: json["price_range"],
//         currencyCode: json["currency_code"],
//         currencySymbol: json["currency_symbol"],
//         currencyMinorUnit: json["currency_minor_unit"],
//         currencyDecimalSeparator: json["currency_decimal_separator"],
//         currencyThousandSeparator: json["currency_thousand_separator"],
//         currencyPrefix: json["currency_prefix"],
//         currencySuffix: json["currency_suffix"],
//         rawPrices: RawPrices.fromJson(json["raw_prices"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "price": price,
//         "regular_price": regularPrice,
//         "sale_price": salePrice,
//         "price_range": priceRange,
//         "currency_code": currencyCode,
//         "currency_symbol": currencySymbol,
//         "currency_minor_unit": currencyMinorUnit,
//         "currency_decimal_separator": currencyDecimalSeparator,
//         "currency_thousand_separator": currencyThousandSeparator,
//         "currency_prefix": currencyPrefix,
//         "currency_suffix": currencySuffix,
//         "raw_prices": rawPrices.toJson(),
//       };
// }
//
// class RawPrices {
//   int precision;
//   String price;
//   String regularPrice;
//   String salePrice;
//
//   RawPrices({
//     required this.precision,
//     required this.price,
//     required this.regularPrice,
//     required this.salePrice,
//   });
//
//   factory RawPrices.fromJson(Map<String, dynamic> json) => RawPrices(
//         precision: json["precision"],
//         price: json["price"],
//         regularPrice: json["regular_price"],
//         salePrice: json["sale_price"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "precision": precision,
//         "price": price,
//         "regular_price": regularPrice,
//         "sale_price": salePrice,
//       };
// }
//
// class QuantityLimits {
//   int minimum;
//   int maximum;
//   int multipleOf;
//   bool editable;
//
//   QuantityLimits({
//     required this.minimum,
//     required this.maximum,
//     required this.multipleOf,
//     required this.editable,
//   });
//
//   factory QuantityLimits.fromJson(Map<String, dynamic> json) => QuantityLimits(
//         minimum: json["minimum"],
//         maximum: json["maximum"],
//         multipleOf: json["multiple_of"],
//         editable: json["editable"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "minimum": minimum,
//         "maximum": maximum,
//         "multiple_of": multipleOf,
//         "editable": editable,
//       };
// }
//
// class ItemTotals {
//   String lineSubtotal;
//   String lineSubtotalTax;
//   String lineTotal;
//   String lineTotalTax;
//   String currencyCode;
//   String currencySymbol;
//   int currencyMinorUnit;
//   String currencyDecimalSeparator;
//   String currencyThousandSeparator;
//   String currencyPrefix;
//   String currencySuffix;
//
//   ItemTotals({
//     required this.lineSubtotal,
//     required this.lineSubtotalTax,
//     required this.lineTotal,
//     required this.lineTotalTax,
//     required this.currencyCode,
//     required this.currencySymbol,
//     required this.currencyMinorUnit,
//     required this.currencyDecimalSeparator,
//     required this.currencyThousandSeparator,
//     required this.currencyPrefix,
//     required this.currencySuffix,
//   });
//
//   factory ItemTotals.fromJson(Map<String, dynamic> json) => ItemTotals(
//         lineSubtotal: json["line_subtotal"],
//         lineSubtotalTax: json["line_subtotal_tax"],
//         lineTotal: json["line_total"],
//         lineTotalTax: json["line_total_tax"],
//         currencyCode: json["currency_code"],
//         currencySymbol: json["currency_symbol"],
//         currencyMinorUnit: json["currency_minor_unit"],
//         currencyDecimalSeparator: json["currency_decimal_separator"],
//         currencyThousandSeparator: json["currency_thousand_separator"],
//         currencyPrefix: json["currency_prefix"],
//         currencySuffix: json["currency_suffix"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "line_subtotal": lineSubtotal,
//         "line_subtotal_tax": lineSubtotalTax,
//         "line_total": lineTotal,
//         "line_total_tax": lineTotalTax,
//         "currency_code": currencyCode,
//         "currency_symbol": currencySymbol,
//         "currency_minor_unit": currencyMinorUnit,
//         "currency_decimal_separator": currencyDecimalSeparator,
//         "currency_thousand_separator": currencyThousandSeparator,
//         "currency_prefix": currencyPrefix,
//         "currency_suffix": currencySuffix,
//       };
// }
//
// class CartModelShippingRate {
//   int packageId;
//   String name;
//   Destination destination;
//   List<ShippingRateItem> items;
//   List<ShippingRateShippingRate> shippingRates;
//
//   CartModelShippingRate({
//     required this.packageId,
//     required this.name,
//     required this.destination,
//     required this.items,
//     required this.shippingRates,
//   });
//
//   factory CartModelShippingRate.fromJson(Map<String, dynamic> json) =>
//       CartModelShippingRate(
//         packageId: json["package_id"],
//         name: json["name"],
//         destination: Destination.fromJson(json["destination"]),
//         items: List<ShippingRateItem>.from(
//             json["items"].map((x) => ShippingRateItem.fromJson(x))),
//         shippingRates: List<ShippingRateShippingRate>.from(
//             json["shipping_rates"]
//                 .map((x) => ShippingRateShippingRate.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "package_id": packageId,
//         "name": name,
//         "destination": destination.toJson(),
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//         "shipping_rates":
//             List<dynamic>.from(shippingRates.map((x) => x.toJson())),
//       };
// }
//
// class Destination {
//   String address1;
//   String address2;
//   String city;
//   String state;
//   String postcode;
//   String country;
//
//   Destination({
//     required this.address1,
//     required this.address2,
//     required this.city,
//     required this.state,
//     required this.postcode,
//     required this.country,
//   });
//
//   factory Destination.fromJson(Map<String, dynamic> json) => Destination(
//         address1: json["address_1"],
//         address2: json["address_2"],
//         city: json["city"],
//         state: json["state"],
//         postcode: json["postcode"],
//         country: json["country"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "address_1": address1,
//         "address_2": address2,
//         "city": city,
//         "state": state,
//         "postcode": postcode,
//         "country": country,
//       };
// }
//
// class ShippingRateItem {
//   String key;
//   String name;
//   int quantity;
//
//   ShippingRateItem({
//     required this.key,
//     required this.name,
//     required this.quantity,
//   });
//
//   factory ShippingRateItem.fromJson(Map<String, dynamic> json) =>
//       ShippingRateItem(
//         key: json["key"],
//         name: json["name"],
//         quantity: json["quantity"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "key": key,
//         "name": name,
//         "quantity": quantity,
//       };
// }
//
// class ShippingRateShippingRate {
//   String rateId;
//   String name;
//   String description;
//   String deliveryTime;
//   String price;
//   String taxes;
//   int instanceId;
//   String methodId;
//   List<MetaDatum> metaData;
//   bool selected;
//   String currencyCode;
//   String currencySymbol;
//   int currencyMinorUnit;
//   String currencyDecimalSeparator;
//   String currencyThousandSeparator;
//   String currencyPrefix;
//   String currencySuffix;
//
//   ShippingRateShippingRate({
//     required this.rateId,
//     required this.name,
//     required this.description,
//     required this.deliveryTime,
//     required this.price,
//     required this.taxes,
//     required this.instanceId,
//     required this.methodId,
//     required this.metaData,
//     required this.selected,
//     required this.currencyCode,
//     required this.currencySymbol,
//     required this.currencyMinorUnit,
//     required this.currencyDecimalSeparator,
//     required this.currencyThousandSeparator,
//     required this.currencyPrefix,
//     required this.currencySuffix,
//   });
//
//   factory ShippingRateShippingRate.fromJson(Map<String, dynamic> json) =>
//       ShippingRateShippingRate(
//         rateId: json["rate_id"],
//         name: json["name"],
//         description: json["description"],
//         deliveryTime: json["delivery_time"],
//         price: json["price"],
//         taxes: json["taxes"],
//         instanceId: json["instance_id"],
//         methodId: json["method_id"],
//         metaData: List<MetaDatum>.from(
//             json["meta_data"].map((x) => MetaDatum.fromJson(x))),
//         selected: json["selected"],
//         currencyCode: json["currency_code"],
//         currencySymbol: json["currency_symbol"],
//         currencyMinorUnit: json["currency_minor_unit"],
//         currencyDecimalSeparator: json["currency_decimal_separator"],
//         currencyThousandSeparator: json["currency_thousand_separator"],
//         currencyPrefix: json["currency_prefix"],
//         currencySuffix: json["currency_suffix"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "rate_id": rateId,
//         "name": name,
//         "description": description,
//         "delivery_time": deliveryTime,
//         "price": price,
//         "taxes": taxes,
//         "instance_id": instanceId,
//         "method_id": methodId,
//         "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
//         "selected": selected,
//         "currency_code": currencyCode,
//         "currency_symbol": currencySymbol,
//         "currency_minor_unit": currencyMinorUnit,
//         "currency_decimal_separator": currencyDecimalSeparator,
//         "currency_thousand_separator": currencyThousandSeparator,
//         "currency_prefix": currencyPrefix,
//         "currency_suffix": currencySuffix,
//       };
// }
//
// class MetaDatum {
//   String key;
//   String value;
//
//   MetaDatum({
//     required this.key,
//     required this.value,
//   });
//
//   factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
//         key: json["key"],
//         value: json["value"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "key": key,
//         "value": value,
//       };
// }
//
// class CartModelTotals {
//   String totalItems;
//   String totalItemsTax;
//   String totalFees;
//   String totalFeesTax;
//   String totalDiscount;
//   String totalDiscountTax;
//   String totalShipping;
//   String totalShippingTax;
//   String totalPrice;
//   String totalTax;
//   List<TaxLine> taxLines;
//   String currencyCode;
//   String currencySymbol;
//   int currencyMinorUnit;
//   String currencyDecimalSeparator;
//   String currencyThousandSeparator;
//   String currencyPrefix;
//   String currencySuffix;
//
//   CartModelTotals({
//     required this.totalItems,
//     required this.totalItemsTax,
//     required this.totalFees,
//     required this.totalFeesTax,
//     required this.totalDiscount,
//     required this.totalDiscountTax,
//     required this.totalShipping,
//     required this.totalShippingTax,
//     required this.totalPrice,
//     required this.totalTax,
//     required this.taxLines,
//     required this.currencyCode,
//     required this.currencySymbol,
//     required this.currencyMinorUnit,
//     required this.currencyDecimalSeparator,
//     required this.currencyThousandSeparator,
//     required this.currencyPrefix,
//     required this.currencySuffix,
//   });
//
//   factory CartModelTotals.fromJson(Map<String, dynamic> json) =>
//       CartModelTotals(
//         totalItems: json["total_items"],
//         totalItemsTax: json["total_items_tax"],
//         totalFees: json["total_fees"],
//         totalFeesTax: json["total_fees_tax"],
//         totalDiscount: json["total_discount"],
//         totalDiscountTax: json["total_discount_tax"],
//         totalShipping: json["total_shipping"],
//         totalShippingTax: json["total_shipping_tax"],
//         totalPrice: json["total_price"],
//         totalTax: json["total_tax"],
//         taxLines: List<TaxLine>.from(
//             json["tax_lines"].map((x) => TaxLine.fromJson(x))),
//         currencyCode: json["currency_code"],
//         currencySymbol: json["currency_symbol"],
//         currencyMinorUnit: json["currency_minor_unit"],
//         currencyDecimalSeparator: json["currency_decimal_separator"],
//         currencyThousandSeparator: json["currency_thousand_separator"],
//         currencyPrefix: json["currency_prefix"],
//         currencySuffix: json["currency_suffix"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "total_items": totalItems,
//         "total_items_tax": totalItemsTax,
//         "total_fees": totalFees,
//         "total_fees_tax": totalFeesTax,
//         "total_discount": totalDiscount,
//         "total_discount_tax": totalDiscountTax,
//         "total_shipping": totalShipping,
//         "total_shipping_tax": totalShippingTax,
//         "total_price": totalPrice,
//         "total_tax": totalTax,
//         "tax_lines": List<dynamic>.from(taxLines.map((x) => x.toJson())),
//         "currency_code": currencyCode,
//         "currency_symbol": currencySymbol,
//         "currency_minor_unit": currencyMinorUnit,
//         "currency_decimal_separator": currencyDecimalSeparator,
//         "currency_thousand_separator": currencyThousandSeparator,
//         "currency_prefix": currencyPrefix,
//         "currency_suffix": currencySuffix,
//       };
// }
//
// class TaxLine {
//   String name;
//   String price;
//   String rate;
//
//   TaxLine({
//     required this.name,
//     required this.price,
//     required this.rate,
//   });
//
//   factory TaxLine.fromJson(Map<String, dynamic> json) => TaxLine(
//         name: json["name"],
//         price: json["price"],
//         rate: json["rate"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "price": price,
//         "rate": rate,
//       };
// }

// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  List<CartModelItem> items;
  List<Coupon> coupons;
  List<dynamic> fees;
  CartModelTotals totals;
  IngAddress shippingAddress;
  IngAddress billingAddress;
  bool needsPayment;
  bool needsShipping;
  List<String> paymentRequirements;
  bool hasCalculatedShipping;
  List<CartModelShippingRate> shippingRates;
  int itemsCount;
  int itemsWeight;
  List<dynamic> crossSells;
  List<dynamic> errors;
  List<String> paymentMethods;
  Extensions extensions;

  CartModel({
    required this.items,
    required this.coupons,
    required this.fees,
    required this.totals,
    required this.shippingAddress,
    required this.billingAddress,
    required this.needsPayment,
    required this.needsShipping,
    required this.paymentRequirements,
    required this.hasCalculatedShipping,
    required this.shippingRates,
    required this.itemsCount,
    required this.itemsWeight,
    required this.crossSells,
    required this.errors,
    required this.paymentMethods,
    required this.extensions,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        items: List<CartModelItem>.from(
            json["items"].map((x) => CartModelItem.fromJson(x))),
        coupons:
            List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
        fees: List<dynamic>.from(json["fees"].map((x) => x)),
        totals: CartModelTotals.fromJson(json["totals"]),
        shippingAddress: IngAddress.fromJson(json["shipping_address"]),
        billingAddress: IngAddress.fromJson(json["billing_address"]),
        needsPayment: json["needs_payment"],
        needsShipping: json["needs_shipping"],
        paymentRequirements:
            List<String>.from(json["payment_requirements"].map((x) => x)),
        hasCalculatedShipping: json["has_calculated_shipping"],
        shippingRates: List<CartModelShippingRate>.from(json["shipping_rates"]
            .map((x) => CartModelShippingRate.fromJson(x))),
        itemsCount: json["items_count"],
        itemsWeight: json["items_weight"],
        crossSells: List<dynamic>.from(json["cross_sells"].map((x) => x)),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        paymentMethods:
            List<String>.from(json["payment_methods"].map((x) => x)),
        extensions: Extensions.fromJson(json["extensions"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
        "fees": List<dynamic>.from(fees.map((x) => x)),
        "totals": totals.toJson(),
        "shipping_address": shippingAddress.toJson(),
        "billing_address": billingAddress.toJson(),
        "needs_payment": needsPayment,
        "needs_shipping": needsShipping,
        "payment_requirements":
            List<dynamic>.from(paymentRequirements.map((x) => x)),
        "has_calculated_shipping": hasCalculatedShipping,
        "shipping_rates":
            List<dynamic>.from(shippingRates.map((x) => x.toJson())),
        "items_count": itemsCount,
        "items_weight": itemsWeight,
        "cross_sells": List<dynamic>.from(crossSells.map((x) => x)),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "payment_methods": List<dynamic>.from(paymentMethods.map((x) => x)),
        "extensions": extensions.toJson(),
      };
}

class IngAddress {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;
  String? email;
  String phone;

  IngAddress({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    this.email,
    required this.phone,
  });

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
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
        "state": state,
        "postcode": postcode,
        "country": country,
        "email": email,
        "phone": phone,
      };
}

class Coupon {
  String code;
  String discountType;
  CouponTotals totals;

  Coupon({
    required this.code,
    required this.discountType,
    required this.totals,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        code: json["code"],
        discountType: json["discount_type"],
        totals: CouponTotals.fromJson(json["totals"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "discount_type": discountType,
        "totals": totals.toJson(),
      };
}

class CouponTotals {
  String totalDiscount;
  String totalDiscountTax;
  String currencyCode;
  String currencySymbol;
  int currencyMinorUnit;
  String currencyDecimalSeparator;
  String currencyThousandSeparator;
  String currencyPrefix;
  String currencySuffix;

  CouponTotals({
    required this.totalDiscount,
    required this.totalDiscountTax,
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
  });

  factory CouponTotals.fromJson(Map<String, dynamic> json) => CouponTotals(
        totalDiscount: json["total_discount"],
        totalDiscountTax: json["total_discount_tax"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
      );

  Map<String, dynamic> toJson() => {
        "total_discount": totalDiscount,
        "total_discount_tax": totalDiscountTax,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
      };
}

class Extensions {
  Extensions();

  factory Extensions.fromJson(Map<String, dynamic> json) => Extensions();

  Map<String, dynamic> toJson() => {};
}

class CartModelItem {
  String key;
  int id;
  int quantity;
  QuantityLimits quantityLimits;
  String name;
  String shortDescription;
  String description;
  String sku;
  dynamic lowStockRemaining;
  bool backordersAllowed;
  bool showBackorderBadge;
  bool soldIndividually;
  String permalink;
  List<Image> images;
  List<dynamic> variation;
  List<dynamic> itemData;
  Prices prices;
  ItemTotals totals;
  String catalogVisibility;
  Extensions extensions;

  CartModelItem({
    required this.key,
    required this.id,
    required this.quantity,
    required this.quantityLimits,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.sku,
    required this.lowStockRemaining,
    required this.backordersAllowed,
    required this.showBackorderBadge,
    required this.soldIndividually,
    required this.permalink,
    required this.images,
    required this.variation,
    required this.itemData,
    required this.prices,
    required this.totals,
    required this.catalogVisibility,
    required this.extensions,
  });

  factory CartModelItem.fromJson(Map<String, dynamic> json) => CartModelItem(
        key: json["key"],
        id: json["id"],
        quantity: json["quantity"],
        quantityLimits: QuantityLimits.fromJson(json["quantity_limits"]),
        name: json["name"],
        shortDescription: json["short_description"],
        description: json["description"],
        sku: json["sku"],
        lowStockRemaining: json["low_stock_remaining"],
        backordersAllowed: json["backorders_allowed"],
        showBackorderBadge: json["show_backorder_badge"],
        soldIndividually: json["sold_individually"],
        permalink: json["permalink"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        variation: List<dynamic>.from(json["variation"].map((x) => x)),
        itemData: List<dynamic>.from(json["item_data"].map((x) => x)),
        prices: Prices.fromJson(json["prices"]),
        totals: ItemTotals.fromJson(json["totals"]),
        catalogVisibility: json["catalog_visibility"],
        extensions: Extensions.fromJson(json["extensions"]),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "id": id,
        "quantity": quantity,
        "quantity_limits": quantityLimits.toJson(),
        "name": name,
        "short_description": shortDescription,
        "description": description,
        "sku": sku,
        "low_stock_remaining": lowStockRemaining,
        "backorders_allowed": backordersAllowed,
        "show_backorder_badge": showBackorderBadge,
        "sold_individually": soldIndividually,
        "permalink": permalink,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "variation": List<dynamic>.from(variation.map((x) => x)),
        "item_data": List<dynamic>.from(itemData.map((x) => x)),
        "prices": prices.toJson(),
        "totals": totals.toJson(),
        "catalog_visibility": catalogVisibility,
        "extensions": extensions.toJson(),
      };
}

class Image {
  int id;
  String src;
  String thumbnail;
  String srcset;
  String sizes;
  String name;
  String alt;

  Image({
    required this.id,
    required this.src,
    required this.thumbnail,
    required this.srcset,
    required this.sizes,
    required this.name,
    required this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        src: json["src"],
        thumbnail: json["thumbnail"],
        srcset: json["srcset"],
        sizes: json["sizes"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
        "thumbnail": thumbnail,
        "srcset": srcset,
        "sizes": sizes,
        "name": name,
        "alt": alt,
      };
}

class Prices {
  String price;
  String regularPrice;
  String salePrice;
  dynamic priceRange;
  String currencyCode;
  String currencySymbol;
  int currencyMinorUnit;
  String currencyDecimalSeparator;
  String currencyThousandSeparator;
  String currencyPrefix;
  String currencySuffix;
  RawPrices rawPrices;

  Prices({
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.priceRange,
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
    required this.rawPrices,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        priceRange: json["price_range"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
        rawPrices: RawPrices.fromJson(json["raw_prices"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "price_range": priceRange,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
        "raw_prices": rawPrices.toJson(),
      };
}

class RawPrices {
  int precision;
  String price;
  String regularPrice;
  String salePrice;

  RawPrices({
    required this.precision,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
  });

  factory RawPrices.fromJson(Map<String, dynamic> json) => RawPrices(
        precision: json["precision"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
      );

  Map<String, dynamic> toJson() => {
        "precision": precision,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
      };
}

class QuantityLimits {
  int minimum;
  int maximum;
  int multipleOf;
  bool editable;

  QuantityLimits({
    required this.minimum,
    required this.maximum,
    required this.multipleOf,
    required this.editable,
  });

  factory QuantityLimits.fromJson(Map<String, dynamic> json) => QuantityLimits(
        minimum: json["minimum"],
        maximum: json["maximum"],
        multipleOf: json["multiple_of"],
        editable: json["editable"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "maximum": maximum,
        "multiple_of": multipleOf,
        "editable": editable,
      };
}

class ItemTotals {
  String lineSubtotal;
  String lineSubtotalTax;
  String lineTotal;
  String lineTotalTax;
  String currencyCode;
  String currencySymbol;
  int currencyMinorUnit;
  String currencyDecimalSeparator;
  String currencyThousandSeparator;
  String currencyPrefix;
  String currencySuffix;

  ItemTotals({
    required this.lineSubtotal,
    required this.lineSubtotalTax,
    required this.lineTotal,
    required this.lineTotalTax,
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
  });

  factory ItemTotals.fromJson(Map<String, dynamic> json) => ItemTotals(
        lineSubtotal: json["line_subtotal"],
        lineSubtotalTax: json["line_subtotal_tax"],
        lineTotal: json["line_total"],
        lineTotalTax: json["line_total_tax"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
      );

  Map<String, dynamic> toJson() => {
        "line_subtotal": lineSubtotal,
        "line_subtotal_tax": lineSubtotalTax,
        "line_total": lineTotal,
        "line_total_tax": lineTotalTax,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
      };
}

class CartModelShippingRate {
  int packageId;
  String name;
  Destination destination;
  List<ShippingRateItem> items;
  List<ShippingRateShippingRate> shippingRates;

  CartModelShippingRate({
    required this.packageId,
    required this.name,
    required this.destination,
    required this.items,
    required this.shippingRates,
  });

  factory CartModelShippingRate.fromJson(Map<String, dynamic> json) =>
      CartModelShippingRate(
        packageId: json["package_id"],
        name: json["name"],
        destination: Destination.fromJson(json["destination"]),
        items: List<ShippingRateItem>.from(
            json["items"].map((x) => ShippingRateItem.fromJson(x))),
        shippingRates: List<ShippingRateShippingRate>.from(
            json["shipping_rates"]
                .map((x) => ShippingRateShippingRate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "package_id": packageId,
        "name": name,
        "destination": destination.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "shipping_rates":
            List<dynamic>.from(shippingRates.map((x) => x.toJson())),
      };
}

class Destination {
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;

  Destination({
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
      };
}

class ShippingRateItem {
  String key;
  String name;
  int quantity;

  ShippingRateItem({
    required this.key,
    required this.name,
    required this.quantity,
  });

  factory ShippingRateItem.fromJson(Map<String, dynamic> json) =>
      ShippingRateItem(
        key: json["key"],
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "quantity": quantity,
      };
}

class ShippingRateShippingRate {
  String rateId;
  String name;
  String description;
  String deliveryTime;
  String price;
  String taxes;
  int instanceId;
  String methodId;
  List<MetaDatum> metaData;
  bool selected;
  String currencyCode;
  String currencySymbol;
  int currencyMinorUnit;
  String currencyDecimalSeparator;
  String currencyThousandSeparator;
  String currencyPrefix;
  String currencySuffix;

  ShippingRateShippingRate({
    required this.rateId,
    required this.name,
    required this.description,
    required this.deliveryTime,
    required this.price,
    required this.taxes,
    required this.instanceId,
    required this.methodId,
    required this.metaData,
    required this.selected,
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
  });

  factory ShippingRateShippingRate.fromJson(Map<String, dynamic> json) =>
      ShippingRateShippingRate(
        rateId: json["rate_id"],
        name: json["name"],
        description: json["description"],
        deliveryTime: json["delivery_time"],
        price: json["price"],
        taxes: json["taxes"],
        instanceId: json["instance_id"],
        methodId: json["method_id"],
        metaData: List<MetaDatum>.from(
            json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        selected: json["selected"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
      );

  Map<String, dynamic> toJson() => {
        "rate_id": rateId,
        "name": name,
        "description": description,
        "delivery_time": deliveryTime,
        "price": price,
        "taxes": taxes,
        "instance_id": instanceId,
        "method_id": methodId,
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "selected": selected,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
      };
}

class MetaDatum {
  String key;
  String value;

  MetaDatum({
    required this.key,
    required this.value,
  });

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class CartModelTotals {
  String totalItems;
  String totalItemsTax;
  String totalFees;
  String totalFeesTax;
  String totalDiscount;
  String totalDiscountTax;
  String totalShipping;
  String totalShippingTax;
  String totalPrice;
  String totalTax;
  List<TaxLine> taxLines;
  String currencyCode;
  String currencySymbol;
  int currencyMinorUnit;
  String currencyDecimalSeparator;
  String currencyThousandSeparator;
  String currencyPrefix;
  String currencySuffix;

  CartModelTotals({
    required this.totalItems,
    required this.totalItemsTax,
    required this.totalFees,
    required this.totalFeesTax,
    required this.totalDiscount,
    required this.totalDiscountTax,
    required this.totalShipping,
    required this.totalShippingTax,
    required this.totalPrice,
    required this.totalTax,
    required this.taxLines,
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
  });

  factory CartModelTotals.fromJson(Map<String, dynamic> json) =>
      CartModelTotals(
        totalItems: json["total_items"],
        totalItemsTax: json["total_items_tax"],
        totalFees: json["total_fees"],
        totalFeesTax: json["total_fees_tax"],
        totalDiscount: json["total_discount"],
        totalDiscountTax: json["total_discount_tax"],
        totalShipping: json["total_shipping"] ?? '',
        totalShippingTax: json["total_shipping_tax"] ?? '',
        totalPrice: json["total_price"],
        totalTax: json["total_tax"],
        taxLines: List<TaxLine>.from(
            json["tax_lines"].map((x) => TaxLine.fromJson(x))),
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        currencyMinorUnit: json["currency_minor_unit"],
        currencyDecimalSeparator: json["currency_decimal_separator"],
        currencyThousandSeparator: json["currency_thousand_separator"],
        currencyPrefix: json["currency_prefix"],
        currencySuffix: json["currency_suffix"],
      );

  Map<String, dynamic> toJson() => {
        "total_items": totalItems,
        "total_items_tax": totalItemsTax,
        "total_fees": totalFees,
        "total_fees_tax": totalFeesTax,
        "total_discount": totalDiscount,
        "total_discount_tax": totalDiscountTax,
        "total_shipping": totalShipping,
        "total_shipping_tax": totalShippingTax,
        "total_price": totalPrice,
        "total_tax": totalTax,
        "tax_lines": List<dynamic>.from(taxLines.map((x) => x.toJson())),
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "currency_minor_unit": currencyMinorUnit,
        "currency_decimal_separator": currencyDecimalSeparator,
        "currency_thousand_separator": currencyThousandSeparator,
        "currency_prefix": currencyPrefix,
        "currency_suffix": currencySuffix,
      };
}

class TaxLine {
  String name;
  String price;
  String rate;

  TaxLine({
    required this.name,
    required this.price,
    required this.rate,
  });

  factory TaxLine.fromJson(Map<String, dynamic> json) => TaxLine(
        name: json["name"],
        price: json["price"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "rate": rate,
      };
}

class OrderProductList {
  final int? product_id;
  final int? quantity;

  OrderProductList({this.product_id, this.quantity});
}
