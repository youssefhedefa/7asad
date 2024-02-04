import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/quantity_row/quantity.dart';
import 'package:flutter/material.dart';

class QuantityRow extends StatelessWidget {
  const QuantityRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'طن\\جم11.000',
          style: TextStyleHelper.font20BoldPrimary,
        ),
        const Spacer(),
        const Quantity(
          buttonHeight: 22,
          buttonWidth: 30,
          fontSize: 22,
        ),
      ],
    );
  }
}
