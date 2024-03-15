import 'package:dio/dio.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/core/networking/remote/api_service/dio_factory.dart';
import 'package:final_project/features/registration/data/repos/log_in_repos/log_in_repo.dart';
import 'package:final_project/features/registration/data/repos/sign_in_repos/sign_in_repo.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_cubit.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

Future<void> setUpSetIt() async{

  // dio && api service
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //sign in
  getIt.registerLazySingleton<SignInRepo>(() => SignInRepo(apiService: getIt()));
  getIt.registerLazySingleton<SignInCubit>(() => SignInCubit(signInRepo: getIt()));

  //log in
  getIt.registerLazySingleton<LogInRepo>(() => LogInRepo(apiService: getIt()));
  getIt.registerLazySingleton<LogInCubit>(() => LogInCubit(logInRepo: getIt()));


}