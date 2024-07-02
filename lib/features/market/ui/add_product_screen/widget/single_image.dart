import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleImage extends StatelessWidget {
  const SingleImage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xffECECEC),
        borderRadius: BorderRadius.circular(4),
      ),
      child: addImageToProduct(
        context: context,
        image: context.read<ProductCubit>().imagesUrl[index],
        index: index,
      ),
    );
  }

  Widget addImageToProduct(
      {required BuildContext context,
      required String image,
      required int index}) {
    return context.read<ProductCubit>().imagesUrl[index].isEmpty
        ? Image.asset(IconHelper.addImageIcon)
        : CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 6,
              ),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 6,
              ),
            ),
            imageBuilder: (context, imageProvider) => AspectRatio(
              aspectRatio: 1.35,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
  }
}
