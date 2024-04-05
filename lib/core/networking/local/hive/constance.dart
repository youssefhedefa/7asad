import 'package:hive/hive.dart';

abstract class BoxConstance{
  static const String userBox = 'userBox';
  static const String experinceBox = 'experinceBox';
}

abstract class KeysConstance{

  static const String userKey = 'user';
  static const String experinceKey = 'experince';
}

abstract class LocalBox{
  static late LazyBox userBox;
  static late LazyBox exprienceBox;
}
