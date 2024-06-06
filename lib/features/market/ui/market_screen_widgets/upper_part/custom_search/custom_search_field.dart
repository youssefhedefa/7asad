import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.enabled, this.controller, this.onChanged});

  final bool enabled;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 1.8, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Offset
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        enabled: enabled,
        cursorColor: ColorHelper.medGreenColor,
        style: TextStyleHelper.font22RegularDarkestGreen
            .copyWith(fontSize: 18),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(IconHelper.searchIcon),
          ),
          filled: true,
          fillColor: Colors.white,
          focusColor: ColorHelper.screenBackgroundColor,
          prefixIconColor: ColorHelper.medGreenColor,
          hoverColor: ColorHelper.screenBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          hintText: 'بحث',
          hintStyle: TextStyleHelper.font15RegularDarkGreen,
        ),
      ),
    );
  }
}