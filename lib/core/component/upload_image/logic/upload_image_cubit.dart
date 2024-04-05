// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:final_project/core/component/upload_image/data/repo/upload_image_repo.dart';
import 'package:final_project/core/component/upload_image/logic/upload_image_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';



class UploadImageCubit extends Cubit<UploadImageState> {

  final UploadImageRepo uploadImageRepo;


  UploadImageCubit({required this.uploadImageRepo})
      : super(const UploadImageState.initial());

  XFile? imageXFile;
  File? imageFile;
  String imageUrl = '';
  FormData? image;
  String? imageMimeType;


  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    XFile? imageX = await picker.pickImage(source: ImageSource.gallery);
    if (imageX!.path.isNotEmpty) {
      imageXFile = imageX;
      imageFile = File(imageXFile!.path);
    }
    imageMimeType = mime(imageFile!.path);
    String name = imageMimeType!.split('/')[0];
    String type = imageMimeType!.split('/')[1];
    image = FormData.fromMap({
      'image':
          await MultipartFile.fromFile(
              imageFile!.path,
            filename: imageFile!.path.split('/').last,
            contentType: MediaType(name, type),
          ),
    });
  }

  void emitUploadImageStates(
    FormData image,
    BuildContext context,
  ) async {
    //print('loading state');
    emit(const UploadImageState.loading());
    final response = await uploadImageRepo.uploadImage(image);
    response.when(
      success: (uploadImageResponse) {
        emit(UploadImageState.success(uploadImageResponse));
      },
      failure: (error) {
        emit(UploadImageState.error(
            error: error.failure.message ?? 'error in upload image'));
      },
    );
  }

}
