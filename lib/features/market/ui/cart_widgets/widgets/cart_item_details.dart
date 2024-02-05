import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_functions/functions.dart';
import 'package:final_project/core/widgets/custom_get_button.dart';
import 'package:flutter/material.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  'قمح خبز منقي',
                  style: TextStyleHelper.font14MediumDarkestGreen,
                ),
                const SizedBox(height: 2,),
                Text(
                  'العدد:2 طن  ',
                  style: TextStyleHelper.font12RegularDarkGreen,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){},
              child: SizedBox(
                height: 12,
                width: 12,
                child: Image.asset(
                  IconHelper.deleteIcon,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 8,),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'طن\\جم11.000',
              style: TextStyleHelper.font14MediumDarkestGreen.copyWith(color: ColorHelper.primaryColor),
            ),
            const Spacer(),
            CustomGetButton(
              height: 4,
              width: 16,
              onTap: (){
                showAlertContact(context,'01004716659');
              },
            ),
          ],
        ),
      ],
    );
  }
}
