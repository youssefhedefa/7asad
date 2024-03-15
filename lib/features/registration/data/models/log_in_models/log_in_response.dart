  import 'package:json_annotation/json_annotation.dart';
  part 'log_in_response.g.dart';

  @JsonSerializable()
  class LogInResponse {
  final String status;
  final String token;
  final Data data;

  LogInResponse(
  {required this.status, required this.token, required this.data});

  factory LogInResponse.fromJson(Map<String,dynamic> json) => _$LogInResponseFromJson(json);

  }

  @JsonSerializable()
  class Data {
  final User user;

  Data({required this.user});

  factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);

  }

  @JsonSerializable()
  class User {
  final String name;
  final String phone;
  final String email;
  final String role;

  @JsonKey(name: '_id')
  final String id;
  final String date;

  @JsonKey(name: '__v')
  final int iV;

  User(
  {required this.name,
  required this.phone,
  required this.email,
  required this.role,
  required this.id,
  required this.date,
  required this.iV});

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  }

