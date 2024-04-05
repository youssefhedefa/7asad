// ignore_for_file: avoid_print

import 'package:final_project/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePhotoStack extends StatelessWidget {
  const ProfilePhotoStack({super.key, required this.image, required this.background});

  final String image;
  final String background;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileState>(
      builder: (BuildContext context, state) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(
              onTap: () async {
                await context.read<ProfileCubit>().pickImages();
                if(context.mounted){
                  context.read<ProfileCubit>().emitUploadBackGroundImageStates(
                      context.read<ProfileCubit>().image!,
                      context,
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height / 9,
                ),
                child: Image.network(
                  background,
                  height: MediaQuery.sizeOf(context).height / 3,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height / 4.5,
              child: GestureDetector(
                onTap: () async {
                  await context.read<ProfileCubit>().pickImages();
                  if(context.mounted){
                    context.read<ProfileCubit>().emitUploadPersonalImageStates(
                      context.read<ProfileCubit>().image!,
                      context,
                    );
                  }
                },
                child: CircleAvatar(
                  radius: MediaQuery.sizeOf(context).height / 9,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    image,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
