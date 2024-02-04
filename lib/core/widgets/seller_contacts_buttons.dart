import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

class SellerContactsButtons extends StatelessWidget {
  const SellerContactsButtons({super.key, this.messageOnTap, this.phoneOnTap});

  final void Function()? messageOnTap;
  final void Function()? phoneOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: messageOnTap,
          icon: const Icon(
            Icons.chat_rounded,
            color: ColorHelper.primaryColor,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: phoneOnTap,
          icon: const Icon(
            Icons.phone,
            color: ColorHelper.primaryColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
