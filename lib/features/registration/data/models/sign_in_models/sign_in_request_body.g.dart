// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestBody _$SignInRequestBodyFromJson(Map<String, dynamic> json) =>
    SignInRequestBody(
      name: json['name'] as String,
      password: json['password'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String? ?? 'yousef@gmail.com',
    );

Map<String, dynamic> _$SignInRequestBodyToJson(SignInRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
      'phone': instance.phone,
      'email': instance.email,
    };
