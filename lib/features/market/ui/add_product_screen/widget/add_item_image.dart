import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/image_grid.dart';
import 'package:flutter/material.dart';

class AddItemImage extends StatelessWidget {
  const AddItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'حمل صور',
            style: TextStyleHelper.font16BoldDarkestGreen
                .copyWith(fontWeight: FontWeightHelper.medium),
          ),
          const SizedBox(height: 18),
          const CustomImageGrid(),
        ],
      ),
    );
  }
}
