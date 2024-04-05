

import 'package:final_project/core/networking/remote/api_service/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'local_service_result.freezed.dart';


@freezed
abstract class LocalServiceResult<T> with _$LocalServiceResult<T>{

  const factory LocalServiceResult.success(T data) = Success<T>;
  const factory LocalServiceResult.failure(ErrorHandler error) = Failure<T>;

}