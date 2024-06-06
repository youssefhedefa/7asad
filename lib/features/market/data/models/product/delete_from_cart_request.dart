class DeleteFromCartRequest {
  DeleteFromCartRequest({
    required this.product,
  });

  final String? product;
  static const String productKey = "product";


  factory DeleteFromCartRequest.fromJson(Map<String, dynamic> json){
    return DeleteFromCartRequest(
      product: json["product"],
    );
  }

  Map<String, dynamic> toJson() => {
    "product": product,
  };

}
