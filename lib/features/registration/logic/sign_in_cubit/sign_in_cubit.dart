import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_request_body.dart';
import 'package:final_project/features/registration/data/phone_auth/auth_services.dart';
import 'package:final_project/features/registration/data/repos/sign_in_repos/sign_in_repo.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SingInState> {
  final SignInRepo signInRepo;
  SignInCubit({required this.signInRepo}) : super(const SingInState.initial());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool errorHappen = false;
  String errorMessage = '';

  void emitSignInStates(
      SignInRequestBody signInRequestBody, BuildContext context) async {
    if (!isClosed) {
      emit(const SingInState.loading());
    }
    final response = await signInRepo.signIn(signInRequestBody);
    response.when(
      success: (signInResponse) async {
        await AuthService.sendOTP(
          phoneNumber: context.read<SignInCubit>().phoneNumberController.text,
          errorStep: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'error in sending opt',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
          nextStep: () {
            Navigator.pushNamed(
              context,
              RoutesManager.phoneAuthScreen,
              arguments: context.read<SignInCubit>().phoneNumberController.text,
            );
          },
        );
        if (!isClosed) {
          emit(SingInState.success(signInResponse));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(SingInState.error(
              error: error));
        }
      },
    );
  }
}
