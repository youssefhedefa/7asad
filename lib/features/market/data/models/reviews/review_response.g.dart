// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      status: json['status'] as String?,
      results: json['results'] as num?,
      data: json['data'] == null
          ? null
          : ReviewData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) => ReviewData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReviewBody.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewDataToJson(ReviewData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ReviewBody _$ReviewBodyFromJson(Map<String, dynamic> json) => ReviewBody(
      id: json['_id'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as num?,
      product: json['product'] as String?,
      user: json['user'] == null
          ? null
          : UserInReview.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      datumId: json['datumId'] as String?,
    );

Map<String, dynamic> _$ReviewBodyToJson(ReviewBody instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'review': instance.review,
      'rating': instance.rating,
      'product': instance.product,
      'user': instance.user,
      'createdAt': instance.createdAt?.toIso8601String(),
      'datumId': instance.datumId,
    };

UserInReview _$UserInReviewFromJson(Map<String, dynamic> json) => UserInReview(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserInReviewToJson(UserInReview instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
