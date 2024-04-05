

import 'package:json_annotation/json_annotation.dart';
part 'log_out_response.g.dart';


@JsonSerializable()
class LogOutResponse {
  LogOutResponse({
    required this.status,
  });

  final String status;

  factory LogOutResponse.fromJson(Map<String,dynamic> json) => _$LogOutResponseFromJson(json);



}