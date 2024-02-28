import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class ProfilePhotoStack extends StatelessWidget {
  const ProfilePhotoStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.sizeOf(context).height / 9,
          ),
          child: Image.asset(
            ImageHelper.testProfileBackgroundImage,
            height: MediaQuery.sizeOf(context).height / 3,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height / 4.5,
          child: CircleAvatar(
            radius: MediaQuery.sizeOf(context).height / 9,
            backgroundColor: Colors.transparent,
            backgroundImage: const AssetImage(
                ImageHelper.testProfileImage,
            ),
          ),
        )
      ],
    );
  }
}
