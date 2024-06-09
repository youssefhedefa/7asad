import 'package:dio/dio.dart';
import 'package:final_project/core/component/upload_image/data/models/upload_image_response.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
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
import 'package:final_project/features/market/data/models/product/search_response.dart';
import 'package:final_project/features/market/data/models/reviews/add_review_product_response.dart';
import 'package:final_project/features/market/data/models/reviews/review_request.dart';
import 'package:final_project/features/market/data/models/reviews/review_response.dart';

class ProductRepo {

  final ApiService apiService;

  ProductRepo({required this.apiService});

  Future<ApiResult<UploadImageResponse>> uploadImage(FormData image) async{
    try{
      final response = await apiService.uploadImage(image);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<ProductData>> getSingleProduct({required String id}) async {

    try{
      final response = await apiService.getSingleProduct(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }

  }

  Future<ApiResult<ProductModel>> getAllProduct() async {

    try{
      final response = await apiService.getAllProduct();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }

  }

  Future<ApiResult<List<ProductData>>> getProductsByCategory({required String category}) async {

    List<ProductData> products = [];

    try{
      final response = await apiService.getProductsByCategory(category);
      products = response.data!.products!;
      print(products.length);
      return ApiResult.success(products);
    } catch (error) {
      print(error.toString());
      return ApiResult.failure(error.toString());
    }

  }

  Future<ApiResult<ReviewModel>> getReviews({required String id}) async {
    List<ReviewModel> reviews = [];
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.getProductReviews(
         id: id,
        cookie: cookie,
       contentType: 'application/json',
      );
      //reviews = response.data.review!;
      return ApiResult.success(response);
    } catch (error) {
      print(error.toString());
      return ApiResult.failure(error.toString());
    }

  }

  Future<ApiResult<AddProductReviewResponseModel>> addReviewToTheProduct({required String id, required ReviewRequestModel reviewRequestModel}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.addProductReviews(
        id: id,
        reviewRequestModel: reviewRequestModel,
        cookie: cookie,
      );
      return ApiResult.success(response);
    } catch (error) {
      print(error.toString());
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<AddProductResponseModel>> addProduct({required AddProductRequestModel addProductRequestModel}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.addProduct(
        addProductRequestModel: addProductRequestModel,
        cookie: cookie,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<SearchResponse>> searchProducts({required String search}) async {
    try{
      final response = await apiService.searchProducts(
        search: search,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  // ------------------------- Favourite Products --------------------

  Future<ApiResult<AddToFavoriteResponse>> addProductToFav({required AddToFavoriteRequest addToFavoriteRequest}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.addProductToFav(
        addToFavoriteRequest: addToFavoriteRequest,
        cookie: cookie,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<FavouritResponse>> getFavouriteProducts() async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.getFavouriteProducts(
        cookie: cookie,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<DeleteFromFavouritResponse>> deleteFavouriteProducts({required String id}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.deleteFavouriteProducts(
        id: id,
        cookie: cookie,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  // ------------------------- Cart ------------------------

  Future<ApiResult<CartResponse>> getCartProducts() async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.getCartProducts(
        cookie: cookie,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<AddToCartResponse>> addProductToCart({required AddToCartRequest addToCartRequest}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.addProductToCart(
        addToCartRequest: addToCartRequest,
        cookie: cookie,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<DeleteFromCartResponse>> deleteProductFromCart({required DeleteFromCartRequest deleteFromCartRequest}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.deleteProductFromCart(
        cookie: cookie,
        deleteFromCartRequest: deleteFromCartRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

}