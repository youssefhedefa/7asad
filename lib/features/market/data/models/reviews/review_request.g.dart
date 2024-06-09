// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewRequestModel _$ReviewRequestModelFromJson(Map<String, dynamic> json) =>
    ReviewRequestModel(
      rating: json['rating'] as int,
      review: json['review'] as String?,
    );

Map<String, dynamic> _$ReviewRequestModelToJson(ReviewRequestModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'review': instance.review,
    };
