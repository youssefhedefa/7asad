import 'package:json_annotation/json_annotation.dart';

part 'add_product_request.g.dart';

@JsonSerializable()
class AddProductRequestModel {
  AddProductRequestModel({
    required this.name,
    required this.description,
    required this.price,
    required this.amount,
    required this.photo,
    required this.place,
    required this.oneItemPrice,
    required this.discount,
    required this.priceAfterDiscount,
    required this.categoryName,
  });

  final String? name;
  static const String nameKey = "name";

  final String? description;
  static const String descriptionKey = "description";

  final num? price;
  static const String priceKey = "price";

  final num? amount;
  static const String amountKey = "amount";

  final List<String>? photo;
  static const String photoKey = "photo";

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


  factory AddProductRequestModel.fromJson(Map<String, dynamic> json) => _$AddProductRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductRequestModelToJson(this);

}
