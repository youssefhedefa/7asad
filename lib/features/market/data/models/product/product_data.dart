import 'package:final_project/core/models/default_user.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/features/market/data/models/product/add_product_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_data.g.dart';

@JsonSerializable()
class ProductModel {
  final String? status;
  final int? results;
  final Data? data;

  ProductModel({this.status, this.results, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.products,
  });

  final List<ProductData>? products;
  static const String productsKey = "products";


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()
class ProductData {
  ProductData({
    required this.id,
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
    required this.date,
    required this.v,
    required this.user,
  });

  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";

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

  final DateTime? date;
  static const String dateKey = "date";


  @JsonKey(name: '__v')
  final num? v;
  static const String vKey = "__v";

  final User? user;
  static const String userKey = "user";


  factory ProductData.fromJson(Map<String, dynamic> json) => _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);

  /// عكككككككككككككككككككك  منك لله يا شوقي الكلب

  ProductData.fromProduct(Product product)
      : id = product.id,
        name = product.name,
        description = product.description,
        photo = product.photo,
        price = product.price,
        amount = product.amount,
        place = product.place,
        oneItemPrice = product.oneItemPrice,
        discount = product.discount,
        priceAfterDiscount = product.priceAfterDiscount,
        categoryName = product.categoryName,
        date = product.date,
        v = product.v,
        //user = getUserById(id: product.user ?? '65fddcfe0cab88b19421193e');
        user = defaultUser();
}
