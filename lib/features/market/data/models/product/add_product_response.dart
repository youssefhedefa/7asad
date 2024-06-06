import 'package:json_annotation/json_annotation.dart';

part 'add_product_response.g.dart';

@JsonSerializable()
class AddProductResponseModel {
  AddProductResponseModel({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory AddProductResponseModel.fromJson(Map<String, dynamic> json) => _$AddProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductResponseModelToJson(this);

}

@JsonSerializable()
class Data {
  Data({
    required this.product,
    required this.user,
  });

  final Product? product;
  static const String productKey = "product";

  final UserPreview? user;
  static const String userKey = "user";


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()
class Product {
  Product({
    required this.name,
    required this.description,
    required this.photo,
    required this.price,
    required this.amount,
    required this.place,
    required this.oneItemPrice,
    required this.discount,
    required this.priceAfterDiscount,
    required this.categoryName,
    required this.user,
    required this.id,
    required this.date,
    required this.v,
  });

  final String? name;
  static const String nameKey = "name";

  final String? description;
  static const String descriptionKey = "description";

  final List<String>? photo;
  static const String photoKey = "photo";

  final num? price;
  static const String priceKey = "price";

  final num? amount;
  static const String amountKey = "amount";

  final String? place;
  static const String placeKey = "place";


  @JsonKey(name: 'OneItemPrice')
  final num? oneItemPrice;
  static const String oneItemPriceKey = "OneItemPrice";

  final num? discount;
  static const String discountKey = "discount";

  final num? priceAfterDiscount;
  static const String priceAfterDiscountKey = "priceAfterDiscount";

  final String? categoryName;
  static const String categoryNameKey = "categoryName";

  final String? user;
  static const String userKey = "user";


  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

  final DateTime? date;
  static const String dateKey = "date";


  @JsonKey(name: '__v')
  final num? v;
  static const String vKey = "__v";


  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}

@JsonSerializable()
class UserPreview {
  UserPreview({
    required this.name,
    required this.phone,
  });

  final String? name;
  static const String nameKey = "name";

  final String? phone;
  static const String phoneKey = "phone";


  factory UserPreview.fromJson(Map<String, dynamic> json) => _$UserPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreviewToJson(this);

}
