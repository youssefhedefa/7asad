import 'package:hive/hive.dart';

class LocalServices{

  static Future<void> putData({required LazyBox lazyBox,required String key,required dynamic value}) async {
    await lazyBox.put(key, value);
  }

  static Future<dynamic> getData({required LazyBox box,required String key}) async {
    return await box.get(key);
  }

  static Future<void> deleteData({required LazyBox box,required String key}) async {
    await box.delete(key);
  }

  static Future<void> clearData({required LazyBox box}) async {
    await box.clear();
  }

}