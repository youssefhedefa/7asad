import 'package:final_project/core/models/user_data.dart';

class GetUserAppointmentResponse {
  GetUserAppointmentResponse({
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


  factory GetUserAppointmentResponse.fromJson(Map<String, dynamic> json){
    return GetUserAppointmentResponse(
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
    required this.appointments,
  });

  final List<UserAppointment> appointments;
  static const String appointmentsKey = "appointments";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      appointments: json["appointments"] == null ? [] : List<UserAppointment>.from(json["appointments"]!.map((x) => UserAppointment.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "appointments": appointments.map((x) => x.toJson()).toList(),
  };

}

class UserAppointment {
  UserAppointment({
    required this.id,
    required this.date,
    required this.time,
    required this.farmer,
    required this.consultant,
    required this.status,
    required this.v,
  });

  final String? id;
  static const String idKey = "_id";

  final DateTime? date;
  static const String dateKey = "date";

  final String? time;
  static const String timeKey = "time";

  final String? farmer;
  static const String farmerKey = "farmer";

  final User? consultant;
  static const String consultantKey = "consultant";

  final String? status;
  static const String statusKey = "status";

  final num? v;
  static const String vKey = "__v";


  factory UserAppointment.fromJson(Map<String, dynamic> json){
    return UserAppointment(
      id: json["_id"],
      date: DateTime.tryParse(json["date"] ?? ""),
      time: json["time"],
      farmer: json["farmer"],
      consultant: json["consultant"] == null ? null : User.fromJson(json["consultant"]),
      status: json["status"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "date": date?.toIso8601String(),
    "time": time,
    "farmer": farmer,
    "consultant": consultant?.toJson(),
    "status": status,
    "__v": v,
  };

}
