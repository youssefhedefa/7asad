import 'package:final_project/core/theming/color_helper.dart';
import 'package:flutter/material.dart';

class AttachAndSendIcon extends StatelessWidget {
  const AttachAndSendIcon({super.key, required this.isAttach, this.onAttachTap, this.onSendTap});

  final bool isAttach;
  final void Function()? onAttachTap;
  final void Function()? onSendTap;

  @override
  Widget build(BuildContext context) {
    return isAttach ? GestureDetector(
      onTap: onAttachTap,
      child: Container(
        //margin: const EdgeInsets.only(top: 7,bottom: 7),
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorHelper.primaryColor,
        ),
        child: const Icon(
          Icons.attach_file,
          color: Colors.white,
        ),
      ),
    ) :
    GestureDetector(
      onTap: onSendTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorHelper.primaryColor,
        ),
        child: Transform.rotate(
          angle: 3.14,
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ),
    ) ;
  }
}
