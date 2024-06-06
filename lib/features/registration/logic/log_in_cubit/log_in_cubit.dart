

import 'package:final_project/features/registration/data/models/log_in_models/log_in_request_body.dart';
import 'package:final_project/features/registration/data/repos/log_in_repos/log_in_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_states.dart';

class LogInCubit extends Cubit<LogInState>{

  final LogInRepo logInRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LogInCubit({required this.logInRepo}) : super(const LogInState.initial());

  bool errorHappen = false;
  String errorMessage = '';

  void emitLogInStates(LoginRequestBody loginRequestBody) async{
    if(!isClosed){
      emit(const LogInState.loading());
    }
    final response = await logInRepo.logIn(loginRequestBody);
    response.when(
      success: (userDataResponse){
        print('success');
        if(!isClosed){
          emit(LogInState.success(userDataResponse));
        }
      },
      failure: (error){
        print('error');
        if(!isClosed){
          emit(const LogInState.error(error: 'رقم الهاتف أو الرقم السري خاطئين'));
        }
      },
    );
  }

}