// ignore_for_file: avoid_print
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/features/market/data/models/product/add_product_request.dart';
import 'package:final_project/features/market/data/models/product/add_product_to_cart_request.dart';
import 'package:final_project/features/market/data/models/product/add_to_favorit_request.dart';
import 'package:final_project/features/market/data/models/product/cart_response.dart';
import 'package:final_project/features/market/data/models/product/delete_from_cart_request.dart';
import 'package:final_project/features/market/data/models/product/favorit_response.dart';
import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/data/models/reviews/review_request.dart';
import 'package:final_project/features/market/data/models/reviews/review_response.dart';
import 'package:final_project/features/market/data/repo/product_repo.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;

  ProductCubit({
    required this.productRepo,
  }) : super(const ProductState.initial());

  List<ProductData> products = [];
  List<String> favProductsId = [];
  List<String> cartProductsId = [];
  List<ProductData> searchProducts = [];
  List<ProductData> searchProductsData = [];
  List<ReviewBody> reviews = [];
  List<Favorite> favouriteProducts = [];
  List<ProductElement> cartProducts = [];
  String label = 'الكل';
  late ProductData product;
  TextEditingController addCommentController = TextEditingController();
  int productRating = 1;



  // --------------------------------- Add Product Controllers ---------------------------------

  final formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productLocationController = TextEditingController();
  // TextEditingController productCategoryController = TextEditingController();
  String selectedCategory = 'محاصيل';
  TextEditingController productAmountController = TextEditingController();

  int mainImageIndex = 0;

  // --------------------------------- Add Product images ---------------------------------

  XFile? imageXFile;
  File? imageFile;
  String imageUrl = '';
  List<String> imagesUrl = [];
  FormData? image;
  String? imageMimeType;

  Future<void> pickImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    XFile? imageX = await picker.pickImage(source: source);
    if (imageX!.path.isNotEmpty) {
      imageXFile = imageX;
      imageFile = File(imageXFile!.path);
    }
    imageMimeType = mime(imageFile!.path);
    String name = imageMimeType!.split('/')[0];
    String type = imageMimeType!.split('/')[1];
    image = FormData.fromMap({
      'image':
      await MultipartFile.fromFile(
        imageFile!.path,
        filename: imageFile!.path.split('/').last,
        contentType: MediaType(name, type),
      ),
    });
  }

  uploadImage() async {
    emit(const ProductState.loadingUploadImage());
    final result = await productRepo.uploadImage(image!);
    result.when(
      success: (data) {
        imageUrl = data.image ?? '';
        imagesUrl.add(imageUrl);
        emit(ProductState.successUploadImage(data));
      },
      failure: (error) {
        emit(ProductState.error(error: error));
      },
    );
  }

  // -----------------------------------------------------------------------

  changeMainImageIndex({required int index}) {
    emit(const ProductState.loadingChangeMainImageIndex());
    mainImageIndex = index;
    print(mainImageIndex);
    emit(const ProductState.successChangeMainImageIndex());
  }

  changeSelectedCategory(String category) {
    label = category;
    emit(const ProductState.changeSelectedCategory());
  }

  getAllProducts() async {
    if (!isClosed) {
      emit(const ProductState.loadingAllProduct());
    }
    final result = await productRepo.getAllProduct();
    result.whenOrNull(
      success: (productsModel) async {
        products = productsModel.data!.products!;
        if (!isClosed) {
          emit(ProductState.successAllProduct(products));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  getProductByCategory({required String category}) async {
    if (!isClosed) {
      emit(const ProductState.loadingProductsByCategory());
    }
    final result = await productRepo.getProductsByCategory(category: category);
    result.whenOrNull(
      success: (productsModel) async {
        products = productsModel;
        if (!isClosed) {
          emit(ProductState.successProductsByCategory(products));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  getSingleProduct({required String id}) async {
    emit(const ProductState.loadingSingleProduct());
    final result = await productRepo.getSingleProduct(id: id);
    result.whenOrNull(
      success: (item) async {
        product = item;
        emit(ProductState.successSingleProduct(products));
      },
      failure: (error) {
        emit(ProductState.error(error: error));
      },
    );
  }

  getProductReviews({required String id}) {
    if (!isClosed) {
      emit(const ProductState.loadingReviews());
    }
    productRepo.getReviews(id: id).then((result) {
      result.whenOrNull(
        success: (reviews) {
          this.reviews = reviews;
          if (!isClosed) {
            emit(ProductState.successReviews(this.reviews));
          }
        },
        failure: (error) {
          if (!isClosed) {
            emit(ProductState.reviewsError(error: error));
          }
        },
      );
    });
  }

  addProductReview(
      {required String id,
      required ReviewRequestModel reviewRequestModel}) async {
    if (!isClosed) {
      emit(const ProductState.loadingAddReview());
    }

    final result = await productRepo.addReviewToTheProduct(
      id: id,
      reviewRequestModel: reviewRequestModel,
    );
    result.whenOrNull(
      success: (response) {
        addCommentController.clear();
        productRating = 1;
        //getProductReviews(id: id);
        if (!isClosed) {
          emit(ProductState.successAddReview(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  addProduct({required AddProductRequestModel addProductRequestModel}) async {
    if (!isClosed) {
      emit(const ProductState.loadingAddProduct());
    }
    final result = await productRepo.addProduct(
        addProductRequestModel: addProductRequestModel);
    result.whenOrNull(
      success: (response) {
        if (!isClosed) {
          emit(ProductState.successAddProduct(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  searchOnProducts({required String text}) async {
    searchProducts.clear();
    searchProductsData.clear();

    if (!isClosed) {
      emit(const ProductState.loadingSearchProduct());
    }
    final result = await productRepo.searchProducts(search: text);
    result.whenOrNull(
      success: (response) {
        searchProducts = response.data?.products ?? [];
        for (var item in searchProducts) {
          searchProductsData.add(item);
        }
        if (!isClosed) {
          emit(
            ProductState.successSearchProduct(products),
          );
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            ProductState.error(error: error),
          );
        }
      },
    );
  }

  getFavouriteProducts() async {
    if (!isClosed) {
      emit(const ProductState.loadingFavouriteProducts());
    }
    final result = await productRepo.getFavouriteProducts();
    result.whenOrNull(
      success: (response) {
        favouriteProducts = response.data!.favorites;
        for (var item in favouriteProducts) {
          favProductsId.add(item.product!.id!);
        }
        if (!isClosed) {
          emit(ProductState.successFavouriteProducts(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  addFavouriteProduct({required AddToFavoriteRequest addToFavoriteRequest}) async {
    if (!isClosed) {
      emit(const ProductState.loadingAddFavouriteProduct());
    }
    final result = await productRepo.addProductToFav(addToFavoriteRequest: addToFavoriteRequest);
    result.whenOrNull(
      success: (response) {
        favProductsId.add(addToFavoriteRequest.product!);
        if (!isClosed) {
          emit(ProductState.successAddFavouriteProduct(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  deleteFavouriteProduct({required String id}) async {
    if (!isClosed) {
      emit(const ProductState.loadingDeleteFavouriteProduct());
    }
    final result = await productRepo.deleteFavouriteProducts(id: id);
    result.whenOrNull(
      success: (response) {
        favProductsId.remove(id);
        if (!isClosed) {
          emit(ProductState.successDeleteFavouriteProduct(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  //---------------------------------------- Cart ----------------------------------------

  Future<void> getCartProducts() async {
    if (!isClosed) {
      emit(const ProductState.loadingCartProducts());
    }
    final result = await productRepo.getCartProducts();
    result.whenOrNull(
      success: (response) {
        cartProducts = response.data!.products;
        for (var item in cartProducts) {
          cartProductsId.add(item.product!.id!);
        }
        if (!isClosed) {
          emit(ProductState.successCartProducts(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  Future<void> addProductToCart({required AddToCartRequest addToCartRequest}) async {
    if (!isClosed) {
      emit(const ProductState.loadingAddCartProduct());
    }
    final result = await productRepo.addProductToCart(addToCartRequest: addToCartRequest);
    result.whenOrNull(
      success: (response) {
        cartProductsId.add(addToCartRequest.product[0]);
        if (!isClosed) {
          emit(ProductState.successAddCartProduct(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

  Future<void> deleteProductFromCart({required String id}) async {
    if (!isClosed) {
      emit(const ProductState.loadingDeleteCartProduct());
    }
    final result = await productRepo.deleteProductFromCart(
      deleteFromCartRequest: DeleteFromCartRequest(product: id),
    );
    result.whenOrNull(
      success: (response) {
        if (!isClosed) {
          cartProductsId.remove(id);
          emit(ProductState.successDeleteCartProduct(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductState.error(error: error));
        }
      },
    );
  }

}
