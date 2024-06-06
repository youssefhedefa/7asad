// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponseModel _$AddProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddProductResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductResponseModelToJson(
        AddProductResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserPreview.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'product': instance.product,
      'user': instance.user,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
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
      user: json['user'] as String?,
      id: json['_id'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      v: json['__v'] as num?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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
      'user': instance.user,
      '_id': instance.id,
      'date': instance.date?.toIso8601String(),
      '__v': instance.v,
    };

UserPreview _$UserPreviewFromJson(Map<String, dynamic> json) => UserPreview(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserPreviewToJson(UserPreview instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };
