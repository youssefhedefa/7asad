import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:flutter/material.dart';

class CommentField extends StatelessWidget {
  const CommentField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(
          verticalPadding: 4,
          rightPadding: 0,
          leftPadding: 0,
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none
            ),
            hintText: 'أكتب تعليقك.....',
            hintStyle: TextStyleHelper.font14RegularDarkestGreen,
          ),
        ),
      ],
    );
  }
}
