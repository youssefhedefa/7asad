import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDigitField extends StatelessWidget {
  final bool? autoFocus;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? hasError;
  final FocusNode? focusNode;

  const CustomDigitField({super.key, this.autoFocus = false, this.controller, this.onChanged, this.hasError = false, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.phone,
      autofocus: autoFocus!,
      focusNode: focusNode,
      style: TextStyleHelper.font22RegularDarkestGreen,
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      onChanged: onChanged ?? (value){
        if(value.length == 1){
          FocusScope.of(context).nextFocus();
        }
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorHelper.darkestGreenColor,width: 2,),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError! ? ColorHelper.errorColor : ColorHelper.darkestGreenColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError! ? ColorHelper.errorColor : ColorHelper.primaryColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
