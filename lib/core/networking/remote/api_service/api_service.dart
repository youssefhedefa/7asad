import 'package:dio/dio.dart';
import 'package:final_project/core/component/upload_image/data/models/upload_image_response.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/remote/api_service/api_constance.dart';
import 'package:final_project/features/community/data/models/add_comment_request.dart';
import 'package:final_project/features/community/data/models/add_comment_response.dart';
import 'package:final_project/features/community/data/models/add_post_request.dart';
import 'package:final_project/features/community/data/models/add_post_response.dart';
import 'package:final_project/features/community/data/models/get_all_comments.dart';
import 'package:final_project/features/community/data/models/get_all_posts_response.dart';
import 'package:final_project/features/market/data/models/product/add_product_request.dart';
import 'package:final_project/features/market/data/models/product/add_product_response.dart';
import 'package:final_project/features/market/data/models/product/add_product_to_cart_request.dart';
import 'package:final_project/features/market/data/models/product/add_product_to_cart_response.dart';
import 'package:final_project/features/market/data/models/product/add_to_fav_response.dart';
import 'package:final_project/features/market/data/models/product/add_to_favorit_request.dart';
import 'package:final_project/features/market/data/models/product/cart_response.dart';
import 'package:final_project/features/market/data/models/product/delet_from_fav_response.dart';
import 'package:final_project/features/market/data/models/product/delete_from_cart_request.dart';
import 'package:final_project/features/market/data/models/product/delete_from_cart_response.dart';
import 'package:final_project/features/market/data/models/product/favorit_response.dart';
import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/data/models/product/product_model_by_category.dart';
import 'package:final_project/features/market/data/models/product/search_response.dart';
import 'package:final_project/features/market/data/models/reviews/add_review_product_response.dart';
import 'package:final_project/features/market/data/models/reviews/review_request.dart';
import 'package:final_project/features/market/data/models/reviews/review_response.dart';
import 'package:final_project/features/profile/data/models/log_out/log_out_response.dart';
import 'package:final_project/features/registration/data/models/log_in_models/log_in_request_body.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_request_body.dart';
import 'package:final_project/features/scan/data/models/all_consultant_response.dart';
import 'package:final_project/features/scan/data/models/appointment_request.dart';
import 'package:final_project/features/scan/data/models/appointment_response.dart';
import 'package:final_project/features/scan/data/models/get_user_appointment.dart';
import 'package:final_project/features/scan/data/prediction_response.dart';
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

  @GET(ApiConstants.getAllConsultants)
  Future<AllConsultantResponse> getAllConsultants({
    @Header("Cookie") required String cookie,
  });

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

  @POST(ApiConstants.uploadImage)
  Future<UploadImageResponse> uploadImage(
    @Body() FormData image,
  );

//----------------------------------- get product ---------------------------------//

  @GET(ApiConstants.getAllProduct)
  Future<ProductModel> getAllProduct();

  @GET(ApiConstants.getSingleProduct)
  Future<ProductData> getSingleProduct(@Path("id") String id);

  @GET(ApiConstants.getProductsByCategory)
  Future<ProductByCategoryModel> getProductsByCategory(
      @Path("category") String category);


  @GET(ApiConstants.getProductReviews)
  Future<ReviewModel> getProductReviews({
    @Path("id") required String id,
    @Header("Cookie") required String cookie,
    @Header("Content-Type") required String contentType,
  });

  @POST(ApiConstants.addProductReviews)
  Future<AddProductReviewResponseModel> addProductReviews({
    @Path("id") required String id,
    @Body() required ReviewRequestModel reviewRequestModel,
    @Header("Cookie") required String cookie,
  });

  @POST(ApiConstants.addProduct)
  Future<AddProductResponseModel> addProduct({
    @Body() required AddProductRequestModel addProductRequestModel,
    @Header("Cookie") required String cookie,
  });

  @GET(ApiConstants.searchProducts)
  Future<SearchResponse> searchProducts({
    @Query("search") required String search,
  });
//----------------------------------- favourite ---------------------------------//
  @GET(ApiConstants.getFavouriteProducts)
  Future<FavouritResponse> getFavouriteProducts({
    @Header("Cookie") required String cookie,
  });

  @DELETE(ApiConstants.deleteFavouriteProducts)
  Future<DeleteFromFavouritResponse> deleteFavouriteProducts({
    @Path("id") required String id,
    @Header("Cookie") required String cookie,
  });

  @POST(ApiConstants.addProductToFav)
  Future<AddToFavoriteResponse> addProductToFav({
    @Body() required AddToFavoriteRequest addToFavoriteRequest,
    @Header("Cookie") required String cookie,
  });
  // --------------------------------- cart -----------------------------//

  @GET(ApiConstants.getCartProducts)
  Future<CartResponse> getCartProducts({
    @Header("Cookie") required String cookie,
  });

  @POST(ApiConstants.addProductToCart)
  Future<AddToCartResponse> addProductToCart({
    @Body() required AddToCartRequest addToCartRequest,
    @Header("Cookie") required String cookie,
  });

  @DELETE(ApiConstants.deleteProductFromCart)
  Future<DeleteFromCartResponse> deleteProductFromCart({
    @Header("Cookie") required String cookie,
    @Body() required DeleteFromCartRequest deleteFromCartRequest,
  });

  //--------------------------------- community --------------------------

  @GET(ApiConstants.getAllPosts)
  Future<AllCommunityPostsResponse> getAllPosts({
    @Header("Cookie") required String cookie,
  });

  @POST(ApiConstants.addPost)
  Future<AddPostResponse> addPost({
    @Body() required AddPostRequest addPostRequest,
    @Header("Cookie") required String cookie,
  });

  @GET(ApiConstants.getCommentsOnPost)
  Future<AllCommentsOnPostResponse> getAllComments({
    @Path("id") required String id,
    @Header("Cookie") required String cookie,
  });

  @POST(ApiConstants.addCommentOnPost)
  Future<AddCommentResponse> addComment({
    @Path("id") required String id,
    @Body() required AddCommentRequest addCommentRequest,
    @Header("Cookie") required String cookie,
  });

  @PATCH(ApiConstants.likePost)
  Future<AddCommentResponse> likePost({
    @Path("id") required String id,
    @Header("Cookie") required String cookie,
  });

  @PATCH(ApiConstants.unlikePost)
  Future<AddCommentResponse> unlikePost({
    @Path("id") required String id,
    @Header("Cookie") required String cookie,
  });

  //--------------------------------- appointment ------------------------

  @POST(ApiConstants.addAppointment)
  Future<AppointmentResponse> addAppointment({
    @Body() required AppointmentRequest appointmentRequest,
    @Header("Cookie") required String cookie,
  });

  @GET(ApiConstants.getUserAppointment)
  Future<GetUserAppointmentResponse> getUserAppointment({
    @Header("Cookie") required String cookie,
  });

}
//----------------------------------- Rice Model ---------------------------------//
@RestApi(baseUrl: ApiConstants.riceModelApiUrl)
abstract class RiceModelApiService {
  factory RiceModelApiService(Dio dio, {String baseUrl}) = _RiceModelApiService;

  @POST(ApiConstants.riceModelPredict)
  Future<PredictionResponse> predictRiceModel(
    @Body() FormData file,
  );


}
