import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_item_head.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.sizeOf(context).height * 0.14,
        width: MediaQuery.sizeOf(context).width - 32,
        decoration: BoxDecoration(
          color: ColorHelper.cardBackgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(1, 3),
              spreadRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const CartItemHead(),
      ),
    );
  }
}
