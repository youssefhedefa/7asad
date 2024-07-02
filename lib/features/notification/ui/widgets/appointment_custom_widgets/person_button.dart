import 'package:final_project/core/constants.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class PersonButton extends StatelessWidget {
  const PersonButton({super.key, required this.consultant});

  final User consultant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      decoration: BoxDecoration(
        color: ColorHelper.discTextColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              consultant.photo ?? Constants.imageStatic,
            ),
          ),
          const SizedBox(width: 4),
          Text(
              consultant.name ?? '',
            style: TextStyleHelper.font14MediumDarkestGreen.copyWith(color: ColorHelper.lightestGreenColor),
          ),
          const SizedBox(width: 3),
          //const Spacer(),
          Transform.rotate(
            angle: 3.14,
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
