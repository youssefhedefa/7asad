abstract class ApiConstants{

  static const String apiBaseUrl = 'https://sevenasad.onrender.com/';
  //static const String apiBaseUrl = 'http://10.0.2.2:3333/';
  //static const String riceModelApiUrl = 'https://lit-taiga-72596-918c74049d5c.herokuapp.com/';
  static const String riceModelApiUrl = 'https://teaam.pythonanywhere.com/';
  static const String riceModelPredict = 'predict';
  static const String uploadImage = 'product/uploadImage';
  static const String signIn = 'auth/register';
  static const String logIn = 'auth/login';
  static const String logOut = 'auth/logout';
  static const String getUser = 'auth/getUser/{id}';
  static const String updateUser = 'auth/updateProfile';
  static const String getAllConsultants = 'auth/getAllConsultants';

//--------------------------------- product ---------------------------

  static const String addProduct = 'product/addOne';
  static const String getAllProduct = 'product/all';
  static const String getSingleProduct = 'product/one/{id}';
  static const String getProductsByCategory = 'product/forCategory/{category}';

  //static const String getProductReview = 'reviews/{id}/reviews';
  static const String getProductReviews = 'reviews/{id}';
  static const String addProductReviews = 'reviews/{id}/reviews';
  static const String searchProducts = 'product/search';
  //--------------------------------- cart -----------------------------
  static const String getCartProducts = 'cart/getCart';
  static const String addProductToCart = 'cart/add';
  static const String deleteProductFromCart = 'cart/remove';
  //--------------------------------- favourite --------------------------
  static const String addProductToFav = 'favorites/add';
  static const String getFavouriteProducts = 'favorites/getFavorites';
  static const String deleteFavouriteProducts = 'favorites/delete/{id}';
  //--------------------------------- community --------------------------
  static const String getAllPosts = 'post';
  static const String getUserPosts = 'post/user/{id}';
  static const String addPost = 'post';
  static const String getCommentsOnPost = 'post/{id}/comment';
  static const String addCommentOnPost = 'post/{id}/comment';
  static const String likePost = 'post/{id}/like';
  static const String unlikePost = 'post/{id}/unlike';

  //--------------------------------- appointment ------------------------
  static const String addAppointment = 'appointment/create';
  static const String getUserAppointment = 'appointment/user';

}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}