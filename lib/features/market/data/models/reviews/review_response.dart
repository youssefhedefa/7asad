//import 'package:json_annotation/json_annotation.dart';
import 'package:final_project/core/models/user_data.dart';
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

  final Data? data;
  static const String dataKey = "data";


  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

}

@JsonSerializable()
class Data {
  Data({
    required this.review,
  });

  final List<Review>? review;
  static const String reviewKey = "review";


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()
class Review {
  Review({
    required this.id,
    required this.review,
    required this.rating,
    required this.product,
    required this.user,
    required this.createdAt,
    required this.v,
    required this.reviewId,
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

  final User? user;
  static const String userKey = "user";

  final DateTime? createdAt;
  static const String createdAtKey = "createdAt";


  @JsonKey(name: '__v')
  final num? v;
  static const String vKey = "__v";

  final String? reviewId;
  static const String reviewIdKey = "id";


  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

}

// @JsonSerializable()
// class User {
//   User({
//     required this.id,
//     required this.name,
//   });
//
//   @JsonKey(name: '_id')
//   final String? id;
//   static const String idKey = "_id";
//
//   final String? name;
//   static const String nameKey = "name";
//
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserToJson(this);
//
// }


// @JsonSerializable()
// class ReviewModel {
//   ReviewModel({
//     required this.status,
//     required this.results,
//     required this.data,
//   });
//
//   final String? status;
//   static const String statusKey = "status";
//
//   final num? results;
//   static const String resultsKey = "results";
//
//   final ReviewData? data;
//   static const String dataKey = "data";
//
//
//   factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
//
// }
//
// @JsonSerializable()
// class ReviewData {
//   ReviewData({
//     required this.data,
//   });
//
//   final List<ReviewBody>? data;
//   static const String dataKey = "data";
//
//
//   factory ReviewData.fromJson(Map<String, dynamic> json) => _$ReviewDataFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ReviewDataToJson(this);
//
// }
//
// @JsonSerializable()
// class ReviewBody {
//   ReviewBody({
//     required this.id,
//     required this.review,
//     required this.rating,
//     required this.product,
//     required this.user,
//     required this.createdAt,
//     required this.datumId,
//   });
//
//   @JsonKey(name: '_id')
//   final String? id;
//   static const String idKey = "_id";
//
//   final String? review;
//   static const String reviewKey = "review";
//
//   final num? rating;
//   static const String ratingKey = "rating";
//
//   final String? product;
//   static const String productKey = "product";
//
//   final UserInReview? user;
//   static const String userKey = "user";
//
//   final DateTime? createdAt;
//   static const String createdAtKey = "createdAt";
//
//   final String? datumId;
//   static const String datumIdKey = "id";
//
//
//   factory ReviewBody.fromJson(Map<String, dynamic> json) => _$ReviewBodyFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ReviewBodyToJson(this);
//
// }
//
// @JsonSerializable()
// class UserInReview {
//   UserInReview({
//     required this.id,
//     required this.name,
//   });
//
//   @JsonKey(name: '_id')
//   final String? id;
//   static const String idKey = "_id";
//
//   final String? name;
//   static const String nameKey = "name";
//
//
//   factory UserInReview.fromJson(Map<String, dynamic> json) => _$UserInReviewFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserInReviewToJson(this);
//
// }
