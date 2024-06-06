
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDataService {
  static final Dio _dio = Dio();

  static final getUserDataByIdProvider = FutureProvider.autoDispose.family<UserData, String>((ref, id) async {
    return await UserDataService.getUserData(id: id);
  });

   static Future<UserData> getUserData({required String id}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      'Cookie': 'jwt=${CachHelper.getToken()}'
    };
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
      _dio.options,
      'https://sevenasad.onrender.com/auth/getUser/$id',
      queryParameters: queryParameters,
      data: _data,
    ));
    final value = UserData.fromJson(_result.data!);
    return value;
  }

}