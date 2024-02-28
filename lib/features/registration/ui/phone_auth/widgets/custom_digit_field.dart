import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDigitField extends StatelessWidget {
  final bool? autoFocus;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomDigitField({super.key, this.autoFocus = false, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.phone,
      autofocus: autoFocus!,
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
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorHelper.darkestGreenColor,width: 2,),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorHelper.primaryColor,width: 2,),
        ),
      ),
    );
  }
}
