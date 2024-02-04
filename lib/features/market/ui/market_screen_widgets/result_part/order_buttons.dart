import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/custom_get_button.dart';
import 'package:flutter/material.dart';

class OrderButtons extends StatelessWidget {
  const OrderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: ColorHelper.primaryColor,
            size: 18,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        CustomGetButton(
          height: 1,
          width: 12,
          onTap: (){
            Navigator.pushNamed(context, RoutesManager.itemDetailScreen);
          },
        ),
      ],
    );
  }
}
