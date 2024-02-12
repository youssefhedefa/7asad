import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/item_details/details_description.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/item_details/details_title.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/quantity_row/quantity_row.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_info.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DetailsTitle(),
          const DetailsDescription(),
          const SizedBox(height: 14),
          Text(
            'البائع',
            style: TextStyleHelper.font14RegularDarkestGreen,
          ),
          const SellerInfo(),
          const SizedBox(height: 14),
          const QuantityRow(),
          const SizedBox(height: 14),
          ActionButton(
            onTap: () {},
            label: 'شراء الأن',
            outerColor: ColorHelper.primaryColor,
            labelColor: Colors.white,
          ),
          const SizedBox(height: 12),
          ActionButton(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.cartScreen);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Container(
                    width: MediaQuery.sizeOf(context).width - 70,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: ColorHelper.successfulColor,
                    ),
                    child: Text(
                      'تمت اضافتها لعربه التسوق',
                      style: TextStyleHelper.font14RegularDis.copyWith(color: Colors.white),
                    ),
                  ),
                  backgroundColor: ColorHelper.screenBackgroundColor,
                  behavior: SnackBarBehavior.floating,
                  elevation: 0,
                ),
              );
            },
            label: 'اضافه الى عربة التسوق',
            outerColor: Colors.white,
            labelColor: ColorHelper.primaryColor,
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }
}
