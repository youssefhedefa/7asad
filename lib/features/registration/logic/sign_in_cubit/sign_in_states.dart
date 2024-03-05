
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_states.freezed.dart';

@freezed
class SingInState<T> with _$SingInState<T>{
  const factory SingInState.initial() = _Initial;
  const factory SingInState.loading() = Loading;
  const factory SingInState.success(T data) = Success<T>;
  const factory SingInState.error({required String error}) = Error;
}

