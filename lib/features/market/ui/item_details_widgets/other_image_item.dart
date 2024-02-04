import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class OtherImageItem extends StatelessWidget {
  const OtherImageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.sizeOf(context).width - 100) / 4,
      width: (MediaQuery.sizeOf(context).width - 100) / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageHelper.testMainItemDetails1Image),
        ),
      ),
    );
  }
}
