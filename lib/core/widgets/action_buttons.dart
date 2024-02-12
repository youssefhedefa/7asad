import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onTap, required this.label, required this.outerColor, required this.labelColor});

  final void Function() onTap;
  final String label;
  final Color outerColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: outerColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorHelper.primaryColor),
        ),
        child: Text(
          label,
          style: TextStyleHelper.font18MediumWhite.copyWith(
            color: labelColor,
          ),
        ),

      ),
    );
  }
}
