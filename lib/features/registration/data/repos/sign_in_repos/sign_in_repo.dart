import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_request_body.dart';

class SignInRepo{
  final ApiService apiService;

  SignInRepo({required this.apiService});

  Future<ApiResult<UserData>> signIn(SignInRequestBody signInRequestBody) async{
    try{
      final response = await apiService.signIn(signInRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(error.toString());
    }
  }
}