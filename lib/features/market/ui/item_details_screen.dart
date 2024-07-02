import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/item_details_widgets/custom_item_details_app_bar.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details_and_review_widget.dart';
import 'package:final_project/features/market/ui/item_details_widgets/main_item_detail_image.dart';
import 'package:final_project/features/market/ui/item_details_widgets/other_item_row_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.product});

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      //value: context.read<ProductCubit>()..getProductReviews(id: product.id!)..getCartProducts(),
      value: context.read<ProductCubit>()..getProductReviews(id: product.id!),
      child: Scaffold(
        appBar: const CustomItemDetailsAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 18,
            top: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<ProductCubit,ProductState>(
                  builder: (context,state) {
                    return MainItemDetailsImage(
                      image: product.photo![context.read<ProductCubit>().mainImageIndex],
                    );
                  }
                ),
                const SizedBox(height: 18),
                OtherItemDetailsImages(
                  product: product,
                ),
                const SizedBox(height: 28),
                DetailsAndReviewsWidget(
                  product: product,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
