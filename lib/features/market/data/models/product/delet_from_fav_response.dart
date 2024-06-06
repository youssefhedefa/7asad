
import 'package:final_project/core/models/user_data.dart';

class DeleteFromFavouritResponse {
  DeleteFromFavouritResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory DeleteFromFavouritResponse.fromJson(Map<String, dynamic> json){
    return DeleteFromFavouritResponse(
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
    required this.user,
  });

  final User? user;
  static const String userKey = "user";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };

}

