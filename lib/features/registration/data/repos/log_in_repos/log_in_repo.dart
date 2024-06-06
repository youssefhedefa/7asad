import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/features/registration/data/models/log_in_models/log_in_request_body.dart';

class LogInRepo{
  final ApiService apiService;

  LogInRepo({required this.apiService});

  Future<ApiResult<UserData>> logIn(LoginRequestBody loginRequestBody) async{
    try{
      final response = await apiService.logIn(loginRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(error.toString());
    }
  }

}