import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_rating.dart';
import 'package:flutter/material.dart';

class SellerDetailsInfo extends StatelessWidget {
  const SellerDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'محمد الشوال',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          'تاجر قمح',
          style: TextStyleHelper.font12RegularDarkGreen,
        ),
        const SellerRating(),
      ],
    );
  }
}
