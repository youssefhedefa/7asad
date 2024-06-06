import 'package:final_project/core/models/user_data.dart';

class AllConsultantResponse {
  AllConsultantResponse({
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


  factory AllConsultantResponse.fromJson(Map<String, dynamic> json){
    return AllConsultantResponse(
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
    required this.users,
  });

  final List<User> users;
  static const String usersKey = "users";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "users": users.map((x) => x.toJson()).toList(),
  };

}

