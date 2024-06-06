
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/upper_part/app_bar/custom_icon.dart';
import 'package:flutter/material.dart';

class CommunityScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CommunityScreenAppBar({super.key});

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
                      'حصاد',
                      //style: TextStyleHelper.font28BoldLightestGreen,
                      style: TextStyleHelper.font32MediumPrimary,
                    ),
                    const Spacer(),
                    CustomIcon(
                      icon: Icons.chat_outlined,
                      borderColor: ColorHelper.iconBorderColor,
                      iconColor: ColorHelper.darkestGreenColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.chatScreen,
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

  @override
  Size get preferredSize => const Size.fromHeight(66);
}
