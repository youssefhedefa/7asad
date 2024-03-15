import 'package:shared_preferences/shared_preferences.dart';

abstract class CachHelper{

  static late SharedPreferences sharedPreferences;
  CachHelper._();

  static String userKey = 'user';

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// user information index :-
  /// 0 ==> response.data.user.id;
  /// 1 ==> response.token;
  /// 2 ==> response.data.user.name;
  /// 3 ==> response.data.user.phone;
  /// 4 ==> response.data.user.role;

  static Future<void> setUserInformation({required List<String> userInfo }){
    return sharedPreferences.setStringList(userKey, userInfo);
  }

  static List<String>? getUserInfo(){
    return sharedPreferences.getStringList(userKey);
  }

}