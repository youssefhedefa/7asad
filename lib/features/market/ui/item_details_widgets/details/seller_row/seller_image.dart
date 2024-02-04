import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class SellerImage extends StatelessWidget {
  const SellerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.sizeOf(context).height * 0.1) - 24,
      width: (MediaQuery.sizeOf(context).height * 0.1) - 24,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageHelper.mohamedImage),
        ),
      ),
    );
  }
}
