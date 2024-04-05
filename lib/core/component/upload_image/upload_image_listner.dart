// ignore_for_file: avoid_print
import 'package:final_project/core/component/upload_image/data/models/upload_image_response.dart';
import 'package:final_project/core/component/upload_image/logic/upload_image_cubit.dart';
import 'package:final_project/core/component/upload_image/logic/upload_image_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadImageListener extends StatelessWidget {
  const UploadImageListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadImageCubit, UploadImageState>(
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
          success: (uploadImageResponse) {
            Navigator.pop(context);
            UploadImageResponse response = uploadImageResponse;
            context.read<UploadImageCubit>().imageUrl = response.image ?? '';
            print(response.image);
            print('success state');
          },
          error: (error) {
            /// todo: need to handle the errors
            print('error state');
            print(error);
            Navigator.pop(context);
            // context.read<UploadImageCubit>().errorHappen = true;
            // context.read<UploadImageCubit>().errorMessage = error;
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
