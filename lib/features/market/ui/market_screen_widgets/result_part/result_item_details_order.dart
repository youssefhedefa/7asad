import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

import 'order_buttons.dart';

class ResultItemDetailsOrder extends StatelessWidget {
  const ResultItemDetailsOrder({super.key, required this.price});

  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'جنيه $price',
          style: TextStyleHelper.font12RegularPrimary,
        ),
        const Spacer(),
        const OrderButtons(),
      ],
    );
  }
}

