import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/image_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddItemImage extends StatelessWidget {
  const AddItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10,
      ),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is LoadingUploadImage) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'حمل صور',
                    style: TextStyleHelper.font16BoldDarkestGreen
                        .copyWith(fontWeight: FontWeightHelper.medium),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        if(context.read<ProductCubit>().imagesUrl.length <= 8){
                          print(context.read<ProductCubit>().imagesUrl.length);
                          await context
                              .read<ProductCubit>()
                              .pickImage(source: ImageSource.camera);
                          if (context.mounted) {
                            if (context.read<ProductCubit>().imageXFile != null) {
                              context.read<ProductCubit>().uploadImage();
                            }
                          }
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('لا يمكنك اضافة اكثر من 8 صور'),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 28,
                        color: ColorHelper.darkestGreenColor,
                      ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const CustomImageGrid(),
            ],
          );
        },
      ),
    );
  }
}
