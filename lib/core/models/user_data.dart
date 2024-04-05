import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String? status;
  final String? token;
  final Data? data;

  UserData(
      { this.status,  this.token,  this.data});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Data {
  final User user;

  Data({required this.user});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}



@JsonSerializable()
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? phone;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? role;
  @HiveField(4)
  final int? userRating;
  final Experince? experince;
  @HiveField(5)
  final String? job;
  @HiveField(6)
  final String? unviersity;
  @HiveField(7)
  final String? faculty;
  @HiveField(8)
  @JsonKey(name: 'Educationaldegree')
  final String? educationalDegree;
  @HiveField(9)
  final String? country;
  @HiveField(10)
  final String? city;
  @HiveField(11)
  String? photo;
  @HiveField(12)
  @JsonKey(name: 'Background')
  String? background;
  @HiveField(13)
  @JsonKey(name: '_id')
  final String? id;
  @HiveField(14)
  final String? date;

  @HiveField(15)
  @JsonKey(name: '__v')
  final int? iV;

  User({
     this.name,
     this.phone,
     this.email,
     this.role,
     this.id,
     this.date,
    this.userRating,
    this.iV,
    this.experince,
    this.job,
    this.unviersity,
    this.faculty,
    this.educationalDegree,
    this.country,
    this.city,
    this.photo,
    this.background,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Experince {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  @JsonKey(name: 'companyName')
  final String? company;
  @HiveField(2)
  @JsonKey(name: 'from')
  final String? startDate;
  @HiveField(3)
  @JsonKey(name: 'to')
  final String? endDate;

  Experince({
    this.title,
    this.company,
    this.startDate,
    this.endDate,
  });

  factory Experince.fromJson(Map<String, dynamic> json) =>
      _$ExperinceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperinceToJson(this);
}
