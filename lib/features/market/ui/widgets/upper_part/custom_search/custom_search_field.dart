import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorHelper.medGreenColor,
      style: TextStyleHelper.font22RegularDarkestGreen
          .copyWith(fontSize: 18),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(IconHelper.searchIcon),
        ),
        filled: true,
        fillColor: ColorHelper.screenBackgroundColor,
        focusColor: ColorHelper.screenBackgroundColor,
        prefixIconColor: ColorHelper.medGreenColor,
        hoverColor: ColorHelper.screenBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorHelper.screenBackgroundColor,
          ),
        ),
        hintText: 'بحث',
        hintStyle: TextStyleHelper.font15RegularDarkGreen,
      ),
    );
  }
}