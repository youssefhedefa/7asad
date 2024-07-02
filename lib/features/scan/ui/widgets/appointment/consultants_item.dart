import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class ConsultantsItem extends StatelessWidget {
  const ConsultantsItem({super.key, required this.selected, required this.name, required this.image});

  final bool selected;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: selected ? ColorHelper.primaryColor : Colors.transparent,
      ),
      child: Column(
        children: [
          Container(
            height: 86,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(image),
              ),
            ),
          ),
          const Expanded(child: SizedBox(height: 8,)),
          Text(
              name,
            style: TextStyleHelper.font16MediumDarkGreen.copyWith(
              color: selected ? Colors.white : ColorHelper.darkestGreenColor,
            ),
          ),
          const SizedBox(height: 4,)
        ],
      ),
    );
  }
}
