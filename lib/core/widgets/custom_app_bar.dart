import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.background,
    this.action,
  });

  final String title;
  final Color background;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: background == ColorHelper.primaryColor
          ? const SystemUiOverlayStyle(
              statusBarColor: ColorHelper.primaryColor,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            )
          : null,
      automaticallyImplyLeading: false,
      backgroundColor: background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0), // Adjust the radius as needed
          bottomRight: Radius.circular(16.0), // Adjust the radius as needed
        ),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                ),
                Text(
                  title,
                  style: TextStyleHelper.font22MediumDarkestGreen
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
