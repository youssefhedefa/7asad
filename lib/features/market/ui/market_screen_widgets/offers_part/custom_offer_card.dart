import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

import 'offer_details.dart';
import 'offer_image.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
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
      child: const Row(
        children: [
          Expanded(
            flex: 60,
            child: AspectRatio(
              aspectRatio: 1.6,
                child: OfferDetails(),
            ),
          ),
          Expanded(
            flex: 40,
            child: AspectRatio(
              aspectRatio: 1.1,
              child: OfferImage(),
            ),
          ),
        ],
      ),
    );
  }
}
