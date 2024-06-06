import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

class SellerContactsButtons extends StatelessWidget {
  const SellerContactsButtons({super.key, this.messageOnTap, this.phoneOnTap, this.messageColor = ColorHelper.primaryColor, this.phoneColor = ColorHelper.primaryColor});

  final void Function()? messageOnTap;
  final void Function()? phoneOnTap;
  final Color? messageColor;
  final Color? phoneColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: messageOnTap,
          icon: Icon(
            Icons.chat_rounded,
            color: messageColor,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: phoneOnTap,
          icon: Icon(
            Icons.phone,
            color: phoneColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
