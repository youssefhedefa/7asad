class FavouritResponse {
  FavouritResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final num? results;
  static const String resultsKey = "results";

  final Data? data;
  static const String dataKey = "data";


  factory FavouritResponse.fromJson(Map<String, dynamic> json){
    return FavouritResponse(
      status: json["status"],
      results: json["results"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "results": results,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.favorites,
  });

  final List<Favorite> favorites;
  static const String favoritesKey = "favorites";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      favorites: json["favorites"] == null ? [] : List<Favorite>.from(json["favorites"]!.map((x) => Favorite.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "favorites": favorites.map((x) => x.toJson()).toList(),
  };

}

class Favorite {
  Favorite({
    required this.id,
    required this.user,
    required this.product,
    required this.v,
  });

  final String? id;
  static const String idKey = "_id";

  final String? user;
  static const String userKey = "user";

  final Product? product;
  static const String productKey = "product";

  final num? v;
  static const String vKey = "__v";


  factory Favorite.fromJson(Map<String, dynamic> json){
    return Favorite(
      id: json["_id"],
      user: json["user"],
      product: json["product"] == null ? null : Product.fromJson(json["product"]),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "product": product?.toJson(),
    "__v": v,
  };

}

class Product {
  Product({
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
    required this.user,
    required this.date,
    required this.v,
  });

  final String? id;
  static const String idKey = "_id";

  final String? name;
  static const String nameKey = "name";

  final String? description;
  static const String descriptionKey = "description";

  final List<String> photo;
  static const String photoKey = "photo";

  final num? price;
  static const String priceKey = "price";

  final num? amount;
  static const String amountKey = "amount";

  final String? place;
  static const String placeKey = "place";

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

  final DateTime? date;
  static const String dateKey = "date";

  final num? v;
  static const String vKey = "__v";


  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      photo: json["photo"] == null ? [] : List<String>.from(json["photo"]!.map((x) => x)),
      price: json["price"],
      amount: json["amount"],
      place: json["place"],
      oneItemPrice: json["OneItemPrice"],
      discount: json["discount"],
      priceAfterDiscount: json["priceAfterDiscount"],
      categoryName: json["categoryName"],
      user: json["user"],
      date: DateTime.tryParse(json["date"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "photo": photo.map((x) => x).toList(),
    "price": price,
    "amount": amount,
    "place": place,
    "OneItemPrice": oneItemPrice,
    "discount": discount,
    "priceAfterDiscount": priceAfterDiscount,
    "categoryName": categoryName,
    "user": user,
    "date": date?.toIso8601String(),
    "__v": v,
  };

}
