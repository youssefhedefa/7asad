import 'package:json_annotation/json_annotation.dart';

part 'add_review_product_response.g.dart';

@JsonSerializable()
class AddProductReviewResponseModel {
  AddProductReviewResponseModel({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final AddProductReviewResponseModelData? data;
  static const String dataKey = "data";


  factory AddProductReviewResponseModel.fromJson(Map<String, dynamic> json) => _$AddProductReviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductReviewResponseModelToJson(this);

}

@JsonSerializable()
class AddProductReviewResponseModelData {
  AddProductReviewResponseModelData({
    required this.data,
  });

  final ResponseData? data;
  static const String dataKey = "data";


  factory AddProductReviewResponseModelData.fromJson(Map<String, dynamic> json) => _$AddProductReviewResponseModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductReviewResponseModelDataToJson(this);

}

@JsonSerializable()
class ResponseData {
  ResponseData({
    required this.review,
    required this.rating,
    required this.product,
    required this.user,
    required this.id,
    required this.createdAt,
    required this.v,
    required this.dataId,
  });

  final String? review;
  static const String reviewKey = "review";

  final num? rating;
  static const String ratingKey = "rating";

  final String? product;
  static const String productKey = "product";

  final String? user;
  static const String userKey = "user";


  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

  final DateTime? createdAt;
  static const String createdAtKey = "createdAt";


  @JsonKey(name: '__v')
  final num? v;
  static const String vKey = "__v";

  final String? dataId;
  static const String dataIdKey = "id";


  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

}
