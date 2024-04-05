import 'package:final_project/core/networking/remote/api_service/api_error_handler.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/features/profile/data/models/log_out/log_out_response.dart';

class LogOutRepo{
  final ApiService apiService;

  LogOutRepo({required this.apiService});

  Future<ApiResult<LogOutResponse>> logOut() async{
    try{
      final response = await apiService.logOut();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}