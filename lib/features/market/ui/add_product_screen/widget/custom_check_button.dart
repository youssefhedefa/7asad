import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

class CustomCheckButton extends StatelessWidget {
  const CustomCheckButton({super.key, required this.selected});

  final bool selected;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: ColorHelper.primaryColor,
              width: 2,
            ),
          ),
        ),
        selected ? const Icon(
            Icons.check,
          color: ColorHelper.primaryColor,
        ) : const SizedBox(),
      ],
    );
  }
}
