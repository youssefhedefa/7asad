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
    this.hasLeading = true,
  });

  final String title;
  final Color background;
  final List<Widget>? action;
  final bool? hasLeading;

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
                hasLeading!
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_outlined,
                            color: background == Colors.white
                                ? ColorHelper.darkestGreenColor
                                : Colors.white),
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    title,
                    style: TextStyleHelper.font22MediumDarkestGreen.copyWith(
                      color: background == Colors.white
                          ? ColorHelper.darkestGreenColor
                          : Colors.white,
                      fontSize: background == Colors.white ? 28 : 22,
                    ),
                  ),
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
