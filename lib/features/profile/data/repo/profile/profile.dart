import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/local/hive/constance.dart';
import 'package:final_project/core/networking/local/hive/local_service_result.dart';
import 'package:final_project/core/networking/local/hive/local_servics.dart';
import 'package:final_project/core/networking/remote/api_service/api_error_handler.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/features/community/data/models/get_all_posts_response.dart';

class ProfileRepo{
  ApiService apiService;
  ProfileRepo({required this.apiService});

  Future<ApiResult<UserData>> getProfile({required String id}) async{
    try{
      final response = await apiService.getUserData(id);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(error.toString());
    }
  }

  Future<LocalServiceResult<User>> getProfileMainUserDataFromLocalData() async {
    try{
      final userData = await LocalServices.getData(box: LocalBox.userBox, key: KeysConstance.userKey);
      return LocalServiceResult.success(userData);
    }
    catch(e){
      return LocalServiceResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<LocalServiceResult<List<Experince>>> getProfileExperinceDataFromLocalData() async {
    try{
      final experinceData = await LocalServices.getData(box: LocalBox.exprienceBox, key: KeysConstance.experinceKey);
      return LocalServiceResult.success(experinceData);
    }
    catch(e){
      return LocalServiceResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<AllCommunityPostsResponse>> getUserPost({required String id}) async{
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.getUserPosts(
        cookie: cookie,
        id: id
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(error.toString());
    }

  }

}