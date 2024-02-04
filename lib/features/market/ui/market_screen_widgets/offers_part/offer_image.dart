import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class OfferImage extends StatelessWidget {
  const OfferImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            ImageHelper.wheatImage,
          ),
        ),
      ),
    );
  }
}
