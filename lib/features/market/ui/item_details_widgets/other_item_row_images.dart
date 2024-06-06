import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/ui/item_details_widgets/other_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherItemDetailsImages extends StatelessWidget {
  const OtherItemDetailsImages({super.key, required this.product});

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ((MediaQuery.sizeOf(context).width - 100) / 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,index) =>  GestureDetector(
            onTap: () {
              context.read<ProductCubit>().changeMainImageIndex(index : index);
              print('index: $index');
            },
            child: OtherImageItem(
                imageUrl: product.photo![index],
            ),
          ),
            separatorBuilder:  (_,index) => const SizedBox(width: 12,),
          itemCount: product.photo!.length,
        ),
      ),
    );
  }
}

