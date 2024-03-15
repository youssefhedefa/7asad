import 'package:dio/dio.dart';
import 'package:final_project/core/networking/remote/api_service/api_constance.dart';
import 'package:final_project/features/registration/data/models/log_in_models/log_in_request_body.dart';
import 'package:final_project/features/registration/data/models/log_in_models/log_in_response.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_request_body.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_response.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// --------------------------------- Auth --------------------------------- //

  @POST(ApiConstants.signIn)
  Future<SignInResponse> signIn(
      @Body() SignInRequestBody signInRequestBody,
      );

  @POST(ApiConstants.logIn)
  Future<LogInResponse> logIn(
      @Body() LoginRequestBody logInRequestBody,
      );
}