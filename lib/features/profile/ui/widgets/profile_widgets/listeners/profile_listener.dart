// ignore_for_file: avoid_print

import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/local/hive/constance.dart';
import 'package:final_project/core/networking/local/hive/local_servics.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/profile/data/models/log_out/log_out_response.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileListener extends StatelessWidget {
  const ProfileListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error ||
          current is LoadingExperienceDataFromLocalStorage ||
          current is SuccessExperienceDataFromLocalStorage ||
          current is LoadingUserDataFromLocalStorage ||
          current is SuccessUserDataFromLocalStorage ||
          current is SuccessLogOut ||
          current is SuccessUpdatePersonalImage||
          current is SuccessUpdateBackGroundImage,
      listener: (context, state) {
        state.whenOrNull(
            successUpdatePersonalImage: (uploadImageResponse) {
            },
            successUpdateBackGroundImage : (uploadImageResponse) {

              print('done from update back ground image state');

              //UploadImageResponse imageResponse = uploadImageResponse;
              //context.read<ProfileCubit>().user.background = uploadImageResponse.image;
              // context.read<ProfileCubit>().updateUserDataEmitStates(
              //   userData: User(
              //     photo: imageResponse.image,
              //   ),
              // );
              //Navigator.pop(context);

            },
            successLogOut: (logOutResponse) {
              LogOutResponse response = logOutResponse;

              LocalServices.clearData(box: LocalBox.userBox);
              LocalServices.clearData(box: LocalBox.exprienceBox);

              CachHelper.clearToken();
              CachHelper.clearId();


              print('done from log out state');
              print(
                  'done from log out state------------------------${LocalServices.getData(box: LocalBox.userBox, key: KeysConstance.userKey)}');

              print(response.status);
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutesManager.logInScreen, (route) => false);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            error: (error) {
              print(error);
            });
      },
      child: const SizedBox.shrink(),
    );
  }
}
