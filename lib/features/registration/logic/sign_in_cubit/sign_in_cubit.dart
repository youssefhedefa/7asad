import 'package:final_project/features/registration/data/models/sign_in_models/sign_in_request_body.dart';
import 'package:final_project/features/registration/data/repos/sign_in_repos/sign_in_repo.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SingInState>{

  final SignInRepo signInRepo;
  SignInCubit({required this.signInRepo}) : super(const SingInState.initial());

  void emitSignInStates(SignInRequestBody signInRequestBody) async{
    emit(const SingInState.loading());

    final response = await signInRepo.signIn(signInRequestBody);

    response.when(
        success: (signInResponse){
          emit(SingInState.success(signInResponse));
        },
      failure: (error){
        emit(SingInState.error(error: error.failure.message ?? 'error in sign in'));
      },
    );

  }



}