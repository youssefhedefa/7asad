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
  User( {
    this.favorites,
    this.experince,
    required this.userRating,
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    //required this.password,
    required this.role,
    required this.date,
    this.v,
    this.educationaldegree,
    required this.city,
    required this.country,
    required this.faculty,
    required this.job,
    required this.background,
    required this.photo,
    required this.unviersity,
  });

  final List<Experince>? experince;
  static const String experinceKey = "experince";

  @HiveField(0)
  final String? name;
  static const String nameKey = "name";

  @HiveField(1)
  final String? phone;
  static const String phoneKey = "phone";

  @HiveField(2)
  final String? email;
  static const String emailKey = "email";

  @HiveField(3)
  final String? role;
  static const String roleKey = "role";

  @HiveField(4)
  final num? userRating;
  static const String userRatingKey = "userRating";


  @HiveField(5)
  final String? job;
  static const String jobKey = "job";

  // @HiveField(6)
  // final String? password;
  // static const String passwordKey = "password";

  @HiveField(7)
  final String? unviersity;
  static const String unviersityKey = "unviersity";


  @HiveField(8)
  final String? faculty;
  static const String facultyKey = "faculty";


  @HiveField(9)
  @JsonKey(name: 'Educationaldegree')
  final String? educationaldegree;
  static const String educationaldegreeKey = "Educationaldegree";


  @HiveField(10)
  final String? country;
  static const String countryKey = "country";

  @HiveField(11)
  final String? city;
  static const String cityKey = "city";


  @HiveField(12)
  final String? photo;
  static const String photoKey = "photo";

  @HiveField(13)
  @JsonKey(name: 'Background')
  final String? background;
  static const String backgroundKey = "Background";

  @HiveField(14)
  @JsonKey(name: '_id')
  final String? id;
  static const String idKey = "_id";


  @HiveField(15)
  final DateTime? date;
  static const String dateKey = "date";

  @HiveField(16)
  @JsonKey(name: '__v')
  final num? v;
  static const String vKey = "__v";

  @HiveField(17)
  final List<String>? favorites;

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
