
import 'package:json_annotation/json_annotation.dart';
part 'sign_in_request_body.g.dart';


@JsonSerializable()
class SignInRequestBody{
  final String name;
  final String password;
  final String passwordConfirm;

  @JsonKey(name: 'phone')
  final String phone;
  final String? email;

  SignInRequestBody({required this.name, required this.password, required this.passwordConfirm, required this.phone, this.email = 'yousef@gmail.com'});

  Map<String,dynamic> toJson() => _$SignInRequestBodyToJson(this);

}