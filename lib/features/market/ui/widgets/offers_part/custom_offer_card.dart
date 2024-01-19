import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

import 'offer_details.dart';
import 'offer_image.dart';

class CustomOfferCard extends StatelessWidget {
  const CustomOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.19,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        bottom: 20,
      ),
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
              child: OfferDetails(),
          ),
          Expanded(
            flex: 40,
              child: OfferImage()),
        ],
      ),
    );
  }
}
