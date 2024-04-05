// ignore_for_file: avoid_print
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/local/hive/constance.dart';
import 'package:final_project/core/networking/local/hive/local_servics.dart';
import 'package:final_project/core/routing/routes.dart';
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
          success: (userDataResponse) async {
            try{
              print('success state');

              UserData response = userDataResponse;

              User user = response.data!.user;
              Experince exprience = response.data!.user.experince!;

              CachHelper.setToken(userInfo: response.token!);
              CachHelper.setId(userInfo: response.data!.user.id!);

              await LocalServices.putData(
                lazyBox: LocalBox.userBox,
                key: KeysConstance.userKey,
                value: user,
              );

              await LocalServices.putData(
                lazyBox: LocalBox.exprienceBox,
                key: KeysConstance.experinceKey,
                value: exprience,
              );

              if(context.mounted){
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, RoutesManager.landScreen);
              }
              else{
                print('error in success state');
              }

            }
            catch(e){
              print('error in success state');
              print(e);
            }

          },
          error: (error) {
            print('error state');
            print(error);
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
