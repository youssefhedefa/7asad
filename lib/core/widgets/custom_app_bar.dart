import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
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
    this.radius,
    this.hasImage = false,
    this.sufixWidget = const SizedBox(),
  });

  final String title;
  final Color background;
  final List<Widget>? action;
  final bool? hasLeading;
  final double? radius;
  final bool? hasImage;
  final Widget? sufixWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: background == ColorHelper.primaryColor
          ? const SystemUiOverlayStyle(
              statusBarColor: ColorHelper.primaryColor,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            )
          : null,
      automaticallyImplyLeading: false,
      backgroundColor: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft:
              Radius.circular(radius ?? 16.0), // Adjust the radius as needed
          bottomRight:
              Radius.circular(radius ?? 16.0), // Adjust the radius as needed
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
                hasImage!
                    ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          height: 44,
                          width: 44,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                ImageHelper.mohamedImage,
                              ),
                            ),
                          ),
                        ),
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
                      fontSize: (background == Colors.white && sufixWidget == null) ? 28 : 22,
                    ),
                  ),
                ),
                const Spacer(),
                sufixWidget!,
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
