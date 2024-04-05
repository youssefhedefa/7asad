
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_image_states.freezed.dart';

@freezed
class UploadImageState<T> with _$UploadImageState<T>{
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = Loading;
  const factory UploadImageState.success(T data) = Success<T>;
  const factory UploadImageState.error({required String error}) = Error;
}

