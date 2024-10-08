// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      favorites: (fields[17] as List?)?.cast<String>(),
      userRating: fields[4] as num?,
      id: fields[14] as String?,
      name: fields[0] as String?,
      phone: fields[1] as String?,
      email: fields[2] as String?,
      role: fields[3] as String?,
      date: fields[15] as DateTime?,
      v: fields[16] as num?,
      educationaldegree: fields[9] as String?,
      city: fields[11] as String?,
      country: fields[10] as String?,
      faculty: fields[8] as String?,
      job: fields[5] as String?,
      background: fields[13] as String?,
      photo: fields[12] as String?,
      unviersity: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.userRating)
      ..writeByte(5)
      ..write(obj.job)
      ..writeByte(7)
      ..write(obj.unviersity)
      ..writeByte(8)
      ..write(obj.faculty)
      ..writeByte(9)
      ..write(obj.educationaldegree)
      ..writeByte(10)
      ..write(obj.country)
      ..writeByte(11)
      ..write(obj.city)
      ..writeByte(12)
      ..write(obj.photo)
      ..writeByte(13)
      ..write(obj.background)
      ..writeByte(14)
      ..write(obj.id)
      ..writeByte(15)
      ..write(obj.date)
      ..writeByte(16)
      ..write(obj.v)
      ..writeByte(17)
      ..write(obj.favorites);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExperinceAdapter extends TypeAdapter<Experince> {
  @override
  final int typeId = 1;

  @override
  Experince read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Experince(
      title: fields[0] as String?,
      company: fields[1] as String?,
      startDate: fields[2] as String?,
      endDate: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Experince obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.company)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExperinceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      status: json['status'] as String?,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      experince: (json['experince'] as List<dynamic>?)
          ?.map((e) => Experince.fromJson(e as Map<String, dynamic>))
          .toList(),
      userRating: json['userRating'] as num?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      v: json['__v'] as num?,
      educationaldegree: json['Educationaldegree'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      faculty: json['faculty'] as String?,
      job: json['job'] as String?,
      background: json['Background'] as String?,
      photo: json['photo'] as String?,
      unviersity: json['unviersity'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'experince': instance.experince,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'role': instance.role,
      'userRating': instance.userRating,
      'job': instance.job,
      'unviersity': instance.unviersity,
      'faculty': instance.faculty,
      'Educationaldegree': instance.educationaldegree,
      'country': instance.country,
      'city': instance.city,
      'photo': instance.photo,
      'Background': instance.background,
      '_id': instance.id,
      'date': instance.date?.toIso8601String(),
      '__v': instance.v,
      'favorites': instance.favorites,
    };

Experince _$ExperinceFromJson(Map<String, dynamic> json) => Experince(
      title: json['title'] as String?,
      company: json['companyName'] as String?,
      startDate: json['from'] as String?,
      endDate: json['to'] as String?,
    );

Map<String, dynamic> _$ExperinceToJson(Experince instance) => <String, dynamic>{
      'title': instance.title,
      'companyName': instance.company,
      'from': instance.startDate,
      'to': instance.endDate,
    };
