import 'package:final_project/features/market/data/models/product/product_data.dart';

class CartResponse {
  CartResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory CartResponse.fromJson(Map<String, dynamic> json){
    return CartResponse(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.products,
  });

  final List<ProductElement> products;
  static const String productsKey = "products";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      products: json["products"] == null ? [] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "products": products.map((x) => x.toJson()).toList(),
  };

}

class ProductElement {
  ProductElement({
    required this.product,
    required this.quantity,
    required this.id,
  });

  final ProductData? product;
  static const String productKey = "product";

  final num? quantity;
  static const String quantityKey = "quantity";

  final String? id;
  static const String idKey = "_id";


  factory ProductElement.fromJson(Map<String, dynamic> json){
    return ProductElement(
      product: json["product"] == null ? null : ProductData.fromJson(json["product"]),
      quantity: json["quantity"],
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "quantity": quantity,
    "_id": id,
  };

}
