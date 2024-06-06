import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onTap, this.onChanged, this.controller, this.onSubmitted});

  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        maxLines: 6,
        minLines: 1,
        keyboardType: TextInputType.multiline,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'اكتب رسالة ',
          hintStyle: TextStyleHelper.font14RegularDarkGreen,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
