// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductRequestModel _$AddProductRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddProductRequestModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as num?,
      amount: json['amount'] as num?,
      photo:
          (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
      place: json['place'] as String?,
      oneItemPrice: json['OneItemPrice'] as num?,
      discount: json['discount'] as num?,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$AddProductRequestModelToJson(
        AddProductRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'amount': instance.amount,
      'photo': instance.photo,
      'place': instance.place,
      'OneItemPrice': instance.oneItemPrice,
      'discount': instance.discount,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'categoryName': instance.categoryName,
    };
