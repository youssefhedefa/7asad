import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_image.dart';
import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_item_details.dart';
import 'package:flutter/material.dart';

class CartItemHead extends StatelessWidget {
  const CartItemHead({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 30,
              child: CartImage(),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 70,
              child: CartItemDetails(),
            ),
          ],
        ),
      ],
    );
  }
}
