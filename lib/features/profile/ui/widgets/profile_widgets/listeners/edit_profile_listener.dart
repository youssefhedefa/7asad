// ignore_for_file: avoid_print

import 'package:final_project/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EditProfileListener extends StatelessWidget {
  const EditProfileListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit,ProfileState>(
        listenWhen: (previous, current) =>
        current is Loading || current is SuccessUpdateUserData || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            print('loading state  edit Cubit');
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
          successUpdateUserData: (userData) {

            print('done from blocListener edit Cubit');

            Navigator.pop(context);
            Navigator.pop(context);

          },
          error: (error) {
            /// todo: need to handle the errors
            print('error state');
            print(error);
            Navigator.pop(context);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
