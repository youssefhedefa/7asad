// ignore_for_file: avoid_print
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/registration/data/phone_auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/features/registration/logic/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(const AuthState.initial());

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  String fullCode = '';

  bool hasError = false;

  FocusNode focusNode = FocusNode();

  Future<void> checkCode(BuildContext context) async {
    fullCode = controllers[0].text +
        controllers[1].text +
        controllers[2].text +
        controllers[3].text +
        controllers[4].text +
        controllers[5].text;
    print(fullCode);
    emit(const AuthState.loading());
    await AuthService.loginWithOTP(otp: fullCode).then(
          (value) {
        if (value == 'Success') {
          Navigator.pushNamedAndRemoveUntil(context,
              RoutesManager.landScreen, (route) => false,);
          emit(const AuthState.success());
        } else {
          print('has error $hasError');
          hasError = true;
          print('has error else $hasError');
          resetControllers();
          emit(AuthState.error(error: value.toString()));
        }
      },
    ).catchError(
          (er) {
            hasError = true;
            print('has error er $hasError');
            emit(AuthState.error(error: er));
            print('error in custom digit form $er');
      },
    );
  }

  void resetControllers(){
    for(int i = 0 ; i < controllers.length ; i++){
      controllers[i].clear();
    }
  }

  // void dispose() {
  //   for (int i = 0; i < controllers.length; i++) {
  //     controllers[i].dispose();
  //   }
  //   focusNode.dispose();
  // }

}