class AppointmentResponse {
  AppointmentResponse({
    required this.status,
    required this.data,
  });

  final String? status;
  static const String statusKey = "status";

  final Data? data;
  static const String dataKey = "data";


  factory AppointmentResponse.fromJson(Map<String, dynamic> json){
    return AppointmentResponse(
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
    required this.appointment,
  });

  final Appointment? appointment;
  static const String appointmentKey = "appointment";


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      appointment: json["appointment"] == null ? null : Appointment.fromJson(json["appointment"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "appointment": appointment?.toJson(),
  };

}

class Appointment {
  Appointment({
    required this.date,
    required this.time,
    required this.farmer,
    required this.consultant,
    required this.status,
    required this.id,
    required this.v,
  });

  final DateTime? date;
  static const String dateKey = "date";

  final String? time;
  static const String timeKey = "time";

  final String? farmer;
  static const String farmerKey = "farmer";

  final String? consultant;
  static const String consultantKey = "consultant";

  final String? status;
  static const String statusKey = "status";

  final String? id;
  static const String idKey = "_id";

  final num? v;
  static const String vKey = "__v";


  factory Appointment.fromJson(Map<String, dynamic> json){
    return Appointment(
      date: DateTime.tryParse(json["date"] ?? ""),
      time: json["time"],
      farmer: json["farmer"],
      consultant: json["consultant"],
      status: json["status"],
      id: json["_id"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date?.toIso8601String(),
    "time": time,
    "farmer": farmer,
    "consultant": consultant,
    "status": status,
    "_id": id,
    "__v": v,
  };

}
