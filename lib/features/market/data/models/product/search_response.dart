import 'package:final_project/features/market/data/models/product/product_data.dart';

class SearchResponse {
  SearchResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final num? results;
  static const String resultsKey = "results";

  final Data? data;
  static const String dataKey = "data";


  factory SearchResponse.fromJson(Map<String, dynamic> json){
    return SearchResponse(
      status: json["status"],
      results: json["results"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "results": results,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.products,
  });

  final List<ProductData> products;
  static const String productsKey = "products";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      products: json["products"] == null ? [] : List<ProductData>.from(json["products"]!.map((x) => ProductData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "products": products.map((x) => x.toJson()).toList(),
  };

}