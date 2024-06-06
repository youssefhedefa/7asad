// ignore_for_file: avoid_print
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInListener extends StatelessWidget {
  const SignInListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SingInState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            print('loading state');
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                ),
              ),
            );
          },
          success: (userDataResponse) {
            print('success state');
            /// todo: save token here
             UserData response = userDataResponse;

            CachHelper.setToken(userInfo: response.token!);
            CachHelper.setId(userInfo: response.data!.user.id!);
            CachHelper.setImageUrl(imageUrl: response.data!.user.photo ?? 'https://static.vecteezy.com/system/resources/previews/036/594/092/non_2x/man-empty-avatar-photo-placeholder-for-social-networks-resumes-forums-and-dating-sites-male-and-female-no-photo-images-for-unfilled-user-profile-free-vector.jpg');


            if(context.mounted){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, RoutesManager.landScreen, (route) => false);
            }
            else{
              print('error in success state');
            }
          },
          error: (error) {
            /// todo: need to handle the errors
            print('error state');
            Navigator.pop(context);
            context.read<SignInCubit>().errorHappen = true;
            context.read<SignInCubit>().errorMessage = error;
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
