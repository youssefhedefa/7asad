import 'package:dio/dio.dart';
import 'package:final_project/core/component/upload_image/data/repo/upload_image_repo.dart';
import 'package:final_project/core/component/upload_image/logic/upload_image_cubit.dart';
import 'package:final_project/core/networking/remote/api_service/api_service.dart';
import 'package:final_project/core/networking/remote/api_service/dio_factory.dart';
import 'package:final_project/features/profile/data/repo/edit_profile/edit_profile_repo.dart';
import 'package:final_project/features/profile/data/repo/log_out/log_out_repo.dart';
import 'package:final_project/features/profile/data/repo/profile/profile.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:final_project/features/registration/data/repos/log_in_repos/log_in_repo.dart';
import 'package:final_project/features/registration/data/repos/sign_in_repos/sign_in_repo.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_cubit.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpSetIt() async {
  // dio && api service
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //sign in
  getIt
      .registerLazySingleton<SignInRepo>(() => SignInRepo(apiService: getIt()));
  getIt.registerLazySingleton<SignInCubit>(
      () => SignInCubit(signInRepo: getIt()));

  //log in
  getIt.registerLazySingleton<LogInRepo>(() => LogInRepo(apiService: getIt()));
  getIt.registerLazySingleton<LogInCubit>(() => LogInCubit(logInRepo: getIt()));

  //user profile
  getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepo(apiService: getIt()));
  getIt.registerLazySingleton<EditProfileRepo>(
      () => EditProfileRepo(apiService: getIt()));
  getIt
      .registerLazySingleton<LogOutRepo>(() => LogOutRepo(apiService: getIt()));
  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(
      profileRepo: getIt(),
      editProfileRepo: getIt(),
      logOutRepo: getIt(),
      uploadImageRepo: getIt(),
    ),
  );

  //upload image
  getIt.registerLazySingleton<UploadImageRepo>(
      () => UploadImageRepo(apiService: getIt()));
  getIt.registerLazySingleton<UploadImageCubit>(
      () => UploadImageCubit(uploadImageRepo: getIt()));
}
