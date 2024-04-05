import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T>{
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loadingUserDataFromLocalStorage() = LoadingUserDataFromLocalStorage;
  const factory ProfileState.loadingExperienceDataFromLocalStorage() = LoadingExperienceDataFromLocalStorage;
  const factory ProfileState.success(T data) = Success<T>;
  const factory ProfileState.successUserDataFromLocalStorage(T data) = SuccessUserDataFromLocalStorage<T>;
  const factory ProfileState.successExperienceDataFromLocalStorage(T data) = SuccessExperienceDataFromLocalStorage<T>;
  const factory ProfileState.successUpdateUserData(T data) = SuccessUpdateUserData<T>;
  const factory ProfileState.successUpdatePersonalImage(T data) = SuccessUpdatePersonalImage<T>;
  const factory ProfileState.successUpdateBackGroundImage(T data) = SuccessUpdateBackGroundImage<T>;
  const factory ProfileState.successLogOut(T data) = SuccessLogOut<T>;
  const factory ProfileState.error({required String error}) = Error;
}