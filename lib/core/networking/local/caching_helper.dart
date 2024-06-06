import 'package:shared_preferences/shared_preferences.dart';

abstract class CachHelper{

  static late SharedPreferences sharedPreferences;
  CachHelper._();

  static String tokenKey = 'user';
  static String idKey = 'userId';
  static String userRemainDataKey = 'remain';
   static String userImageUrl = 'image';

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // user information index :-
  // 0 ==> response.data.user.id;
  // 1 ==> response.token;
  // 2 ==> response.data.user.name;
  // 3 ==> response.data.user.phone;
  // 4 ==> response.data.user.role;
  // 5 ==> response.data.user.rating;

  // static Future<void> setMainUserInformation({required List<String> userInfo }){
  //   return sharedPreferences.setStringList(userMainDataKey, userInfo);
  // }
  //
  // static List<String>? getMainUserInfo(){
  //   return sharedPreferences.getStringList(userMainDataKey);
  // }
  //
  // static Future<void> clearMainUserInfo(){
  //   return sharedPreferences.remove(userMainDataKey);
  // }

  static Future<void> setToken({required String userInfo }){
    return sharedPreferences.setString(tokenKey, userInfo);
  }

  static String getToken(){
    return sharedPreferences.getString(tokenKey) ?? '';
  }

  static Future<void> clearToken(){
    return sharedPreferences.remove(tokenKey);
  }

  static Future<void> setImageUrl({required String imageUrl }){
    return sharedPreferences.setString(userImageUrl, imageUrl);
  }

  static String getImageUrl(){
    return sharedPreferences.getString(userImageUrl) ?? 'https://static.vecteezy.com/system/resources/previews/036/594/092/non_2x/man-empty-avatar-photo-placeholder-for-social-networks-resumes-forums-and-dating-sites-male-and-female-no-photo-images-for-unfilled-user-profile-free-vector.jpg';
  }

  static Future<void> clearImageUrl(){
    return sharedPreferences.remove(userImageUrl);
  }

  static Future<void> setId({required String userInfo }){
    return sharedPreferences.setString(idKey, userInfo);
  }

  static String getId(){
    return sharedPreferences.getString(idKey) ?? '';
  }

  static Future<void> clearId(){
    return sharedPreferences.remove(idKey);
  }

  // response.data.user.photo!,
  // response.data.user.background!,
  // response.data.user.country!,
  // response.data.user.city!,
  // response.data.user.unvirsety!,
  // response.data.user.faculty!,
  // response.data.user.educationalDegree!,
  // response.data.user.experince!.title!,
  // response.data.user.experince!.company!,
  // response.data.user.experince!.startDate!,
  // response.data.user.experince!.endDate!,

  static Future<void> setRemainUserInformation({required List<String> userInfo }){
    return sharedPreferences.setStringList(userRemainDataKey, userInfo);
  }

  static List<String>? getRemainUserInfo(){
    return sharedPreferences.getStringList(userRemainDataKey);
  }

  static Future<void> clearRemainUserInfo(){
    return sharedPreferences.remove(userRemainDataKey);
  }
}