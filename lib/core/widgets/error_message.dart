import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(top: 24),
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width,
      color: ColorHelper.errorColor,
      child: Text(
          text,
        style: TextStyleHelper.font16BoldWhite,
      ),
    );
  }
}
