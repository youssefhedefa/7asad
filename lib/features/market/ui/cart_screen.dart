import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'عربة التسوق',
        background: ColorHelper.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const CartItem(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: 3,
            ),
            const SizedBox(height: 28,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'المجموع الكلي',
                        style: TextStyleHelper.font22MediumDarkestGreen,
                      ),
                      const Spacer(),
                      Text(
                        'جم 24.000',
                        style: TextStyleHelper.font22MediumDarkestGreen,
                      ),
                    ],
                  ),
                  const SizedBox(height: 28,),
                  // ActionButton(
                  //   onTap: () {},
                  //   label: 'شراء الأن',
                  //   outerColor: ColorHelper.primaryColor,
                  //   labelColor: Colors.white,
                  // ),
                  // const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
