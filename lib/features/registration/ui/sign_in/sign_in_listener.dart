// ignore_for_file: avoid_print
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_response.dart';
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
          success: (singInResponse) {
            print('success state');
            /// todo: save token here
            SignInResponse response = singInResponse;
            List<String> userInfo = [
            response.data.user.id,
            response.token,
            response.data.user.name,
            response.data.user.phone,
            response.data.user.role,
            ];
            CachHelper.setUserInformation(userInfo: userInfo);
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
