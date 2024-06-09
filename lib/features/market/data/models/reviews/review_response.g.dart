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
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      review: (json['review'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'review': instance.review,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['_id'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as num?,
      product: json['product'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      v: json['__v'] as num?,
      reviewId: json['reviewId'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      '_id': instance.id,
      'review': instance.review,
      'rating': instance.rating,
      'product': instance.product,
      'user': instance.user,
      'createdAt': instance.createdAt?.toIso8601String(),
      '__v': instance.v,
      'reviewId': instance.reviewId,
    };
