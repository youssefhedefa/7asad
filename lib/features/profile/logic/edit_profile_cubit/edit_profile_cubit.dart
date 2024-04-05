// ignore_for_file: avoid_print, non_constant_identifier_names

// import 'dart:convert';
//
// import 'package:bloc/bloc.dart';
// import 'package:final_project/core/models/user_data.dart';
// import 'package:final_project/core/networking/local/caching_helper.dart';
// import 'package:final_project/core/networking/local/hive/constance.dart';
// import 'package:final_project/core/networking/local/hive/local_servics.dart';
// import 'package:final_project/features/profile/data/repo/edit_profile/edit_profile_repo.dart';
// import 'package:final_project/features/profile/logic/edit_profile_cubit/edit_profile_states.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class EditProfileCubit extends Cubit<EditProfileStates> {
//   EditProfileCubit({required this.editProfileRepo})
//       : super(const EditProfileStates.initial());
//
//
//   //     .then((value) {
//   //   print(value.body);
//   //   emit(EditProfileStates.success(value.body));
//   // }).catchError((error) {
//   //   print(error);
//   //   emit(EditProfileStates.error(error: error.toString()));
//   // });
// }
//
// class TestUserUpdate {
//   final String name;
//   final String job;
//   final String Educationaldegree;
//   final String city;
//   final String country;
//   final String unviersity;
//   final String faculty;
//   final Experince experince;
//
//   TestUserUpdate({
//     required this.name,
//     required this.job,
//     required this.Educationaldegree,
//     required this.city,
//     required this.country,
//     required this.unviersity,
//     required this.faculty,
//     required this.experince,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'job': job,
//       'Educationaldegree': Educationaldegree,
//       'city': city,
//       'country': country,
//       'unviersity': unviersity,
//       'faculty': faculty,
//       'experince': experince.toJson(),
//
//     };
//   }
//
//   factory TestUserUpdate.fromJson(Map<String, dynamic> json) {
//     return TestUserUpdate(
//       name: json['name'],
//       job: json['job'],
//       Educationaldegree: json['Educationaldegree'],
//       city: json['city'],
//       country: json['country'],
//       unviersity: json['unviersity'],
//       faculty: json['faculty'],
//       experince: Experince.fromJson(json['experince']),
//     );
//   }
// }
