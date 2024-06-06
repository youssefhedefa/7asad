class DeleteFromCartResponse {
  DeleteFromCartResponse({
    required this.status,
    required this.message,
  });

  final String? status;
  static const String statusKey = "status";

  final String? message;
  static const String messageKey = "message";


  factory DeleteFromCartResponse.fromJson(Map<String, dynamic> json){
    return DeleteFromCartResponse(
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };

}
