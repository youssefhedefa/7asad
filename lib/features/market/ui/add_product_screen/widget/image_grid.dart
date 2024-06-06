import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/single_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageGrid extends StatelessWidget {
  const CustomImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (80 * 2) + 16,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 80,
        ),
        itemBuilder: (BuildContext context, int index) => SingleImage(
          index: index,
        ),
        itemCount: context.read<ProductCubit>().imagesUrl.length,
      ),
    );
  }
}
