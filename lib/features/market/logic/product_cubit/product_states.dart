import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_states.freezed.dart';

@freezed
class ProductState<T> with _$ProductState<T>{
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loadingAllProduct() = LoadingAllProduct;
  const factory ProductState.successAllProduct(T data) = SuccessAllProduct<T>;
  const factory ProductState.loadingSingleProduct() = LoadingSingleProduct;
  const factory ProductState.successSingleProduct(T data) = SuccessSingleProduct<T>;
  const factory ProductState.loadingProductsByCategory() = LoadingProductsByCategory;
  const factory ProductState.successProductsByCategory(T data) = SuccessProductsByCategory<T>;
  const factory ProductState.loadingReviews() = LoadingReviews;
  const factory ProductState.successReviews(T data) = SuccessReviews<T>;
  const factory ProductState.loadingAddReview() = LoadingAddReview;
  const factory ProductState.successAddReview(T data) = SuccessAddReview<T>;
  const factory ProductState.loadingAddProduct() = LoadingAddProduct;
  const factory ProductState.successAddProduct(T data) = SuccessAddProduct<T>;
  const factory ProductState.loadingSearchProduct() = LoadingSearchProduct;
  const factory ProductState.successSearchProduct(T data) = SuccessSearchProduct<T>;
  const factory ProductState.changeSelectedCategory() = ChangeSelectedCategory<T>;

  const factory ProductState.loadingChangeMainImageIndex() = LoadingChangeMainImageIndex<T>;
  const factory ProductState.successChangeMainImageIndex() = SuccessChangeMainImageIndex<T>;

  const factory ProductState.loadingFavouriteProducts() = LoadingFavouriteProducts;
  const factory ProductState.successFavouriteProducts(T data) = SuccessFavouriteProducts<T>;
  const factory ProductState.loadingAddFavouriteProduct() = LoadingAddFavouriteProduct;
  const factory ProductState.successAddFavouriteProduct(T data) = SuccessAddFavouriteProduct<T>;
  const factory ProductState.loadingDeleteFavouriteProduct() = LoadingDeleteFavouriteProduct<T>;
  const factory ProductState.successDeleteFavouriteProduct(T data) = SuccessDeleteFavouriteProduct<T>;

  const factory ProductState.loadingCartProducts() = LoadingCartProducts;
  const factory ProductState.successCartProducts(T data) = SuccessCartProducts<T>;
  const factory ProductState.loadingAddCartProduct() = LoadingAddCartProduct;
  const factory ProductState.successAddCartProduct(T data) = SuccessAddCartProduct<T>;
  const factory ProductState.loadingDeleteCartProduct() = LoadingDeleteCartProduct<T>;
  const factory ProductState.successDeleteCartProduct(T data) = SuccessDeleteCartProduct<T>;


  const factory ProductState.loadingUploadImage() = LoadingUploadImage;
  const factory ProductState.successUploadImage(T data) = SuccessUploadImage<T>;

  const factory ProductState.error({required String error}) = Error;
  const factory ProductState.reviewsError({required String error}) = ReviewsError;
}