
import 'package:dio/dio.dart';
import 'package:final_project/core/component/upload_image/data/models/upload_image_response.dart';
import 'package:final_project/core/networking/remote/api_service/api_error_handler.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';

class UploadImageRepo{
  final ApiService apiService;

  UploadImageRepo({required this.apiService});

  Future<ApiResult<UploadImageResponse>> uploadImage(FormData image) async{
    try{
      final response = await apiService.uploadImage(image);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}