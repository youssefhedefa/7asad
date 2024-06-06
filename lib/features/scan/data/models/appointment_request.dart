class AppointmentRequest {
  AppointmentRequest({
    required this.date,
    required this.time,
    required this.consultant,
  });

  final DateTime? date;
  static const String dateKey = "date";

  final String? time;
  static const String timeKey = "time";

  final String? consultant;
  static const String consultantKey = "consultant";


  factory AppointmentRequest.fromJson(Map<String, dynamic> json){
    return AppointmentRequest(
      date: DateTime.tryParse(json["date"] ?? ""),
      time: json["time"],
      consultant: json["consultant"],
    );
  }

  Map<String, dynamic> toJson() => {
    "date": "${date?.year.toString().padLeft(4)}-${date?.month.toString().padLeft(2)}-${date?.day.toString().padLeft(2)}",
    "time": time,
    "consultant": consultant,
  };

}
