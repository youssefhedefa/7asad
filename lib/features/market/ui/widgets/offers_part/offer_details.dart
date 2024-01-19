import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'custom_get_button.dart';
import 'description_text.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Text(
          '2 طن قمح خبز',
          style: TextStyleHelper.font16BoldDarkestGreen,
        ),
        const Expanded(child: SizedBox(height: 6)),
        const DescriptionText(),
        const Expanded(child: SizedBox(height: 4)),
        const CustomGetButton(
          height: 4,
        ),
      ],
    );
  }
}

