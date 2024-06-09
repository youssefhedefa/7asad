import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';


class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key, required this.label, required this.pageController, this.onPressed});

  final String label;
  final PageController pageController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: ColorHelper.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: Text(
          label,
          style: TextStyleHelper.font14MediumWhite,
        ),
      ),
    );
  }
}
