class AddToCartResponse {
  AddToCartResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory AddToCartResponse.fromJson(Map<String, dynamic> json){
    return AddToCartResponse(
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
    required this.cartProductsDetails,
  });

  final CartProductsDetails? cartProductsDetails;
  static const String cartProductsDetailsKey = "cartProductsDetails";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      cartProductsDetails: json["cartProductsDetails"] == null ? null : CartProductsDetails.fromJson(json["cartProductsDetails"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "cartProductsDetails": cartProductsDetails?.toJson(),
  };

}

class CartProductsDetails {
  CartProductsDetails({
    required this.id,
    required this.user,
    required this.products,
    required this.v,
  });

  final String? id;
  static const String idKey = "_id";

  final String? user;
  static const String userKey = "user";

  final List<ProductElement> products;
  static const String productsKey = "products";

  final num? v;
  static const String vKey = "__v";


  factory CartProductsDetails.fromJson(Map<String, dynamic> json){
    return CartProductsDetails(
      id: json["_id"],
      user: json["user"],
      products: json["products"] == null ? [] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "products": products.map((x) => x.toJson()).toList(),
    "__v": v,
  };

}

class ProductElement {
  ProductElement({
    required this.product,
    required this.quantity,
    required this.id,
  });

  final ProductProduct? product;
  static const String productKey = "product";

  final num? quantity;
  static const String quantityKey = "quantity";

  final String? id;
  static const String idKey = "_id";


  factory ProductElement.fromJson(Map<String, dynamic> json){
    return ProductElement(
      product: json["product"] == null ? null : ProductProduct.fromJson(json["product"]),
      quantity: json["quantity"],
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "quantity": quantity,
    "_id": id,
  };

}

class ProductProduct {
  ProductProduct({
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


  factory ProductProduct.fromJson(Map<String, dynamic> json){
    return ProductProduct(
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
