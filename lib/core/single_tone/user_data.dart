import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/hive/constance.dart';
import 'package:final_project/core/networking/local/hive/local_servics.dart';

class UserSingleTone{

  UserSingleTone._();

  static UserSingleTone? _instance;

  factory UserSingleTone.getInstance() {
    _instance ??= UserSingleTone._();
    return _instance!;
  }

  static User userInfo = User();
  static Experince userExperince = Experince();
  Future<User> getUser() async {
    userInfo = await LocalServices.getData(box: LocalBox.userBox, key: KeysConstance.userKey);
    return userInfo;
  }
  Future<Experince> getExperince() async {
    userExperince = await LocalServices.getData(box: LocalBox.exprienceBox, key: KeysConstance.experinceKey);
    return userExperince;
  }

}