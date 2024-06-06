import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:flutter/material.dart';

class MainItemDetailsImage extends StatelessWidget {
  const MainItemDetailsImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // image: DecorationImage(
        //   fit: BoxFit.fill,
        //   image: returnImage(),
        // ),
      ),
      child: returnImage(),
    );
  }
  Widget returnImage(){
    if(image.isNotEmpty){
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
            image,
            fit: BoxFit.fill,
        ),
      );
    } else {
      return Image.asset(
          ImageHelper.testMainItemDetailsImage,
        fit: BoxFit.fill,
      );
    }
  }
}
