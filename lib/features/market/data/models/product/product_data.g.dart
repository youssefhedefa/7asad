// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      status: json['status'] as String?,
      results: json['results'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'products': instance.products,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photo:
          (json['photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as num?,
      amount: json['amount'] as num?,
      place: json['place'] as String?,
      oneItemPrice: json['OneItemPrice'] as num?,
      discount: json['discount'] as num?,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      categoryName: json['categoryName'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      v: json['__v'] as num?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photo': instance.photo,
      'price': instance.price,
      'amount': instance.amount,
      'place': instance.place,
      'OneItemPrice': instance.oneItemPrice,
      'discount': instance.discount,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'categoryName': instance.categoryName,
      'date': instance.date?.toIso8601String(),
      '__v': instance.v,
      'user': instance.user,
    };
