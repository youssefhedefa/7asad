import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class SellerImage extends StatelessWidget {
  const SellerImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return returnImage(context);
  }

  Widget returnImage(BuildContext context){
    if(image.isEmpty){
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
    }else{
      return Container(
        height: (MediaQuery.sizeOf(context).height * 0.1) - 24,
        width: (MediaQuery.sizeOf(context).height * 0.1) - 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(image),
          ),
        ),
      );
    }
  }
}
