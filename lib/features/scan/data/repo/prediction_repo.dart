import 'package:dio/dio.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/remote/api_service/api_result.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/features/scan/data/models/all_consultant_response.dart';
import 'package:final_project/features/scan/data/models/appointment_request.dart';
import 'package:final_project/features/scan/data/models/appointment_response.dart';
import 'package:final_project/features/scan/data/models/get_user_appointment.dart';
import 'package:final_project/features/scan/data/prediction_response.dart';

class PredictionRepo{

  RiceModelApiService riceModelApiService;
  ApiService apiService;


  PredictionRepo({required this.riceModelApiService, required this.apiService});

  Future<ApiResult<PredictionResponse>> getPrediction(FormData image) async {
    try{
     final response = await riceModelApiService.predictRiceModel(image);
     return ApiResult.success(response);
    }catch(error){
      print('-------------------  $error');
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<AllConsultantResponse>> getAllConsultants() async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.getAllConsultants(cookie: cookie);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<AppointmentResponse>> bookAppointment({required AppointmentRequest appointmentRequest}) async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.addAppointment(
        cookie: cookie,
        appointmentRequest: appointmentRequest
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<GetUserAppointmentResponse>> getUserAppointments() async {
    String cookie = 'jwt=${CachHelper.getToken()}';
    try{
      final response = await apiService.getUserAppointment(cookie: cookie);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(error.toString());
    }
  }

}