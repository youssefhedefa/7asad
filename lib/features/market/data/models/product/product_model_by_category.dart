import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model_by_category.g.dart';

@JsonSerializable()
class ProductByCategoryModel {
  ProductByCategoryModel({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory ProductByCategoryModel.fromJson(Map<String, dynamic> json) => _$ProductByCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductByCategoryModelToJson(this);

}
