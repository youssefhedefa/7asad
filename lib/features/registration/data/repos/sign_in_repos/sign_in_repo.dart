import 'package:final_project/core/networking/remote/api_service/api_error_handler.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_request_body.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_response.dart';

class SignInRepo{
  final ApiService apiService;

  SignInRepo({required this.apiService});

  Future<ApiResult<SignInResponse>> signIn(SignInRequestBody signInRequestBody) async{
    try{
      final response = await apiService.signIn(signInRequestBody);
      return ApiResult.success(response);

    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}