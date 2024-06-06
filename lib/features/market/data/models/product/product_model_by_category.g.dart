// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model_by_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductByCategoryModel _$ProductByCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductByCategoryModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductByCategoryModelToJson(
        ProductByCategoryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
