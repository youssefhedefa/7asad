// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductReviewResponseModel _$AddProductReviewResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddProductReviewResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : AddProductReviewResponseModelData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductReviewResponseModelToJson(
        AddProductReviewResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

AddProductReviewResponseModelData _$AddProductReviewResponseModelDataFromJson(
        Map<String, dynamic> json) =>
    AddProductReviewResponseModelData(
      data: json['data'] == null
          ? null
          : ResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductReviewResponseModelDataToJson(
        AddProductReviewResponseModelData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      review: json['review'] as String?,
      rating: json['rating'] as num?,
      product: json['product'] as String?,
      user: json['user'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      v: json['__v'] as num?,
      dataId: json['dataId'] as String?,
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'review': instance.review,
      'rating': instance.rating,
      'product': instance.product,
      'user': instance.user,
      '_id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      '__v': instance.v,
      'dataId': instance.dataId,
    };
