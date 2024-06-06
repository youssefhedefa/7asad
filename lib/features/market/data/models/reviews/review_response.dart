import 'package:json_annotation/json_annotation.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewModel {
  ReviewModel({
    required this.status,
    required this.results,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final num? results;
  static const String resultsKey = "results";

  final ReviewData? data;
  static const String dataKey = "data";


  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

}

@JsonSerializable()
class ReviewData {
  ReviewData({
    required this.data,
  });

  final List<ReviewBody>? data;
  static const String dataKey = "data";


  factory ReviewData.fromJson(Map<String, dynamic> json) => _$ReviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDataToJson(this);

}

@JsonSerializable()
class ReviewBody {
  ReviewBody({
    required this.id,
    required this.review,
    required this.rating,
    required this.product,
    required this.user,
    required this.createdAt,
    required this.datumId,
  });

  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

  final String? review;
  static const String reviewKey = "review";

  final num? rating;
  static const String ratingKey = "rating";

  final String? product;
  static const String productKey = "product";

  final UserInReview? user;
  static const String userKey = "user";

  final DateTime? createdAt;
  static const String createdAtKey = "createdAt";

  final String? datumId;
  static const String datumIdKey = "id";


  factory ReviewBody.fromJson(Map<String, dynamic> json) => _$ReviewBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewBodyToJson(this);

}

@JsonSerializable()
class UserInReview {
  UserInReview({
    required this.id,
    required this.name,
  });

  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

  final String? name;
  static const String nameKey = "name";


  factory UserInReview.fromJson(Map<String, dynamic> json) => _$UserInReviewFromJson(json);

  Map<String, dynamic> toJson() => _$UserInReviewToJson(this);

}
