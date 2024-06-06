import 'package:json_annotation/json_annotation.dart';

part 'review_request.g.dart';

@JsonSerializable()
class ReviewRequestModel {
  ReviewRequestModel({
    required this.rating,
    required this.review,
  });

  final int rating;
  static const String ratingKey = "rating";

  final String? review;
  static const String reviewKey = "review";


  factory ReviewRequestModel.fromJson(Map<String, dynamic> json) => _$ReviewRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewRequestModelToJson(this);

}
