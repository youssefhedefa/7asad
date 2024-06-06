class AddToFavoriteRequest {
  AddToFavoriteRequest({
    required this.product,
  });

  final String? product;
  static const String productKey = "product";


  factory AddToFavoriteRequest.fromJson(Map<String, dynamic> json){
    return AddToFavoriteRequest(
      product: json["product"],
    );
  }

  Map<String, dynamic> toJson() => {
    "product": product,
  };

}
