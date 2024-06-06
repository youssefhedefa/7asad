import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'custom_icon.dart';

class CustomMarketAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomMarketAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(66);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 18.0, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'السوق',
                      //style: TextStyleHelper.font28BoldLightestGreen,
                      style: TextStyleHelper.font32MediumPrimary,
                    ),
                    const Spacer(),
                    CustomIcon(
                      icon: Icons.add,
                      borderColor: ColorHelper.iconBorderColor,
                      iconColor: ColorHelper.darkestGreenColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.addProductScreen,
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0, bottom: 10),
                      child: SizedBox(
                        width: 8,
                      ),
                    ),
                    CustomIcon(
                      icon: Icons.favorite_outline,
                      borderColor: ColorHelper.iconBorderColor,
                      iconColor: ColorHelper.darkestGreenColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.favoriteScreen,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIcon(
                      icon: Icons.shopping_cart_outlined,
                      borderColor: ColorHelper.iconBorderColor,
                      iconColor: ColorHelper.darkestGreenColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.cartScreen,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
