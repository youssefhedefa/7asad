//
// // ignore_for_file: depend_on_referenced_packages
//
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:mime_type/mime_type.dart';
// import 'package:http_parser/http_parser.dart';
//
// class UploadImageRequest {
//   final File image;
//
//   Future<FormData> uploadFile(File file) async {
//
//     String? imageMimeType = mime(file.path);
//     String name = imageMimeType!.split('/')[0];
//     String type = imageMimeType.split('/')[1];
//     return FormData.fromMap({
//       'image':
//       await MultipartFile.fromFile(
//         file.path,
//         filename: file.path.split('/').last,
//         contentType: MediaType(name, type),
//       ),
//     });
//   }
//
//   UploadImageRequest({
//     required this.image,
//   });
//
//   Future<Map<String, dynamic>> toJson() async {
//     return {
//       'image': await uploadFile(image),
//     };
//   }
//
//
//   factory UploadImageRequest.fromJson(Map<String, dynamic> json) {
//     return UploadImageRequest(
//       image: json['image'],
//     );
//   }
//
// }
