import 'package:final_project/core/routing/routes.dart';
import 'package:flutter/material.dart';

class CustomItemDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomItemDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      notificationPredicate: (_) => false,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesManager.cartScreen);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
