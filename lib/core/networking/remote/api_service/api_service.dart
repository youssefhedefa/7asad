import 'package:dio/dio.dart';
import 'package:final_project/core/component/upload_image/data/models/upload_image_response.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/remote/api_service/api_constance.dart';
import 'package:final_project/features/profile/data/models/log_out/log_out_response.dart';
import 'package:final_project/features/registration/data/models/log_in_models/log_in_request_body.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_request_body.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// --------------------------------- Auth --------------------------------- //

  @POST(ApiConstants.signIn)
  Future<UserData> signIn(
      @Body() SignInRequestBody signInRequestBody,
      );

  @POST(ApiConstants.logIn)
  Future<UserData> logIn(
      @Body() LoginRequestBody logInRequestBody,
      );

  @GET(ApiConstants.logOut)
  Future<LogOutResponse> logOut();

// --------------------------------- User --------------------------------- //

  @GET(ApiConstants.getUser)
  Future<UserData> getUserData(@Path("id") String id);

  @PATCH(ApiConstants.updateUser)
  Future<UserData> updateUserData(
      @Body() User userData,
      @Header("Cookie") String cookie,
      @Header("Content-Type") String contentType,
      );

// --------------------------------- Upload Image --------------------------------- //

//create a new endpoint for uploading image with different base url
  @POST(ApiConstants.uploadImage)
  Future<UploadImageResponse> uploadImage(
      @Body() FormData image,
      );

}