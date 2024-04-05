
// ignore_for_file: avoid_print

import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/remote/api_service/api_error_handler.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';

class EditProfileRepo{
  final ApiService apiService;

  EditProfileRepo({required this.apiService});

  Future<ApiResult<UserData>> updateUserData(User userData) async {

    try {
      String cookie = 'jwt=${CachHelper.getToken()}';
      final response = await apiService.updateUserData(
          userData ,
          cookie,
          'application/json',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}