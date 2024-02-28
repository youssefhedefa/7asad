import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditFieldItem extends StatelessWidget {
  const EditFieldItem({super.key, required this.label, required this.hint, this.controller, this.textFormatList, this.onChange, this.validator});

  final String label;
  final String hint;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textFormatList;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
            label, //label
          style: TextStyleHelper.font16MediumDarkestGreen,
        ),
        const SizedBox(height: 8,),
        TextFormField(
          controller: controller,
          inputFormatters: textFormatList,
          onChanged: onChange,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 11,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.darkGreenColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.darkGreenColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.errorColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorHelper.errorColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            hintText: hint, // hint
            hintStyle: TextStyleHelper.font14RegularDarkGreen,
          ),
        ),
        const SizedBox(height: 16,),
      ],
    );
  }
}
