class AddToCartRequest {
  AddToCartRequest({
    required this.quantity,
    required this.product,
  });

  final num? quantity;
  static const String quantityKey = "quantity";

  final List<String> product;
  static const String productKey = "product";


  factory AddToCartRequest.fromJson(Map<String, dynamic> json){
    return AddToCartRequest(
      quantity: json["quantity"],
      product: json["product"] == null ? [] : List<String>.from(json["product"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "product": product.map((x) => x).toList(),
  };

}
