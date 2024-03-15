// ignore_for_file: avoid_print

import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/registration/data/models/log_in_models/log_in_response.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_cubit.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInListener extends StatelessWidget {
  const LogInListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit , LogInState>(
      listenWhen: (previous, current) => current is Loading ||current is Success || current is Error,
      listener: (context, state){
        state.whenOrNull(
          loading: () {
            print('loading state');
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  //color: ColorHelper.primaryColor,
                  backgroundColor: Colors.black,
                  color: Colors.white,
                ),
              ),
            );
          },
          success: (logInResponse) {
            print('success state');
            LogInResponse response = logInResponse;
            List<String> userInfo = [
              response.data.user.id,
              response.token,
              response.data.user.name,
              response.data.user.phone,
              response.data.user.role
            ];

            CachHelper.setUserInformation(userInfo: userInfo);

            Navigator.pop(context);
            Navigator.pushNamed(context, RoutesManager.landScreen);

          },
          error: (error) {
            print('error state');
            Navigator.pop(context);
            context.read<LogInCubit>().errorHappen = true;
            context.read<LogInCubit>().errorMessage = error;
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
