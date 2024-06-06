import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/features/community/data/models/add_comment_request.dart';
import 'package:final_project/features/community/data/models/add_comment_response.dart';
import 'package:final_project/features/community/data/models/add_post_request.dart';
import 'package:final_project/features/community/data/models/add_post_response.dart';
import 'package:final_project/features/community/data/models/get_all_comments.dart';
import 'package:final_project/features/community/data/models/get_all_posts_response.dart';

class CommunityRepo {
  final ApiService apiService;

  CommunityRepo({required this.apiService});

  Future<ApiResult<AllCommunityPostsResponse>> getAllPosts() async {
    String cookie = CachHelper.getToken();
    try {
      final response = await apiService.getAllPosts(cookie: cookie);
      return ApiResult.success(response);
    } catch (e) {
      print(e.toString());
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<AddPostResponse>> addPost(
      {required String text, required String image}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try {
      final response = await apiService.addPost(
        cookie: cookie,
        addPostRequest: AddPostRequest(
          content: text,
          image: image,
        ),
      );
      return ApiResult.success(response);
    } catch (e) {
      print(e.toString());
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<AllCommentsOnPostResponse>> getCommentsPosts(
      {required String id}) async {
    String cookie = CachHelper.getToken();
    try {
      final response = await apiService.getAllComments(cookie: cookie, id: id);
      return ApiResult.success(response);
    } catch (e) {
      print(e.toString());
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<AddCommentResponse>> addComment(
      {required String id, required String text}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    print(cookie);
    try {
      final response = await apiService.addComment(
        cookie: cookie,
        id: id,
        addCommentRequest: AddCommentRequest(
          text: text,
        ),
      );
      return ApiResult.success(response);
    } catch (e) {
      print(e.toString());
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<AddCommentResponse>> likePost({required String id}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try {
      final response = await apiService.likePost(
        cookie: cookie,
        id: id,
      );
      return ApiResult.success(response);
    } catch (e) {
      print(e.toString());
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<AddCommentResponse>> unlikePost({required String id}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try {
      final response = await apiService.unlikePost(
        cookie: cookie,
        id: id,
      );
      return ApiResult.success(response);
    } catch (e) {
      print(e.toString());
      return ApiResult.failure(e.toString());
    }
  }


}
