import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/data/section_model.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.model});

  final SectionModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.12 - 22,
          width: MediaQuery.sizeOf(context).height * 0.12 - 22,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorHelper.cardBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(1, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: Image.asset(
              model.icon,
          ),
        ),
        const Expanded(child: SizedBox(height: 5,)),
        Text(
          model.label,
          style: TextStyleHelper.font12RegularDarkGreen,
        ),
      ],
    );
  }
}
