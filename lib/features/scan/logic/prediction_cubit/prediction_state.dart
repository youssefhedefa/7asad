import 'package:freezed_annotation/freezed_annotation.dart';
part 'prediction_state.freezed.dart';

@freezed
class PredictionState<T> with _$PredictionState<T> {
  const factory PredictionState.initial() = _Initial;
  const factory PredictionState.loading() = LoadingPredictionState;
  const factory PredictionState.success(T data) = SuccessPrdeictionState<T>;
  const factory PredictionState.loadingConsultants() = LoadingConsultantsState;
  const factory PredictionState.successConsultants(T data) = SuccessConsultantsState<T>;
  const factory PredictionState.loadingBookAppointment() = LoadingBookAppointment;
  const factory PredictionState.successBookAppointment(T data) = SuccessBookAppointment<T>;
  const factory PredictionState.loadingUserAppointments() = LoadingUserAppointment;
  const factory PredictionState.successUserAppointment(T data) = SuccessUserAppointment<T>;
  const factory PredictionState.loadingUserAppointmentsByDate() = LoadingUserAppointmentByDate;
  const factory PredictionState.successUserAppointmentByDate(T data) = SuccessUserAppointmentByDate<T>;
  const factory PredictionState.error({required String error}) = Error;
}