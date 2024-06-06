class AddToFavoriteResponse {
  AddToFavoriteResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory AddToFavoriteResponse.fromJson(Map<String, dynamic> json){
    return AddToFavoriteResponse(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.favorite,
  });

  final SubFavorite? favorite;
  static const String favoriteKey = "favorite";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      favorite: json["favorite"] == null ? null : SubFavorite.fromJson(json["favorite"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "favorite": favorite?.toJson(),
  };

}

class SubFavorite {
  SubFavorite({
    required this.user,
    required this.product,
    required this.id,
    required this.v,
  });

  final String? user;
  static const String userKey = "user";

  final String? product;
  static const String productKey = "product";

  final String? id;
  static const String idKey = "_id";

  final num? v;
  static const String vKey = "__v";


  factory SubFavorite.fromJson(Map<String, dynamic> json){
    return SubFavorite(
      user: json["user"],
      product: json["product"],
      id: json["_id"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "user": user,
    "product": product,
    "_id": id,
    "__v": v,
  };

}
