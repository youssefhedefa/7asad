// ignore_for_file: avoid_print
import 'package:final_project/features/registration/logic/auth_cubit/auth_cubit.dart';
import 'package:final_project/features/registration/logic/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthListener extends StatelessWidget {
  const AuthListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
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
          success: () {
          },
          error: (error) {
            print('error state');
            Navigator.pop(context);
            context.read<AuthCubit>().hasError = true;
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
