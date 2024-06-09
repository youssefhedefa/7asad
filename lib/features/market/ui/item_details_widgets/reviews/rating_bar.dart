import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRatingBars extends StatelessWidget {
  const CustomRatingBars({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductState>(
      builder: (context,state) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.18,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.only(
            top: 24,
            right: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRatingBar(title: 'ممتاز', percent: (context.read<ProductCubit>().productRatingMap[5]!)/(context.read<ProductCubit>().totalRating), color: ColorHelper.excellentColor,),
              CustomRatingBar(title: 'جيد جدا', percent: (context.read<ProductCubit>().productRatingMap[4]!)/(context.read<ProductCubit>().totalRating), color: ColorHelper.veryGoodColor,),
              CustomRatingBar(title: 'جيد', percent: (context.read<ProductCubit>().productRatingMap[3]!)/(context.read<ProductCubit>().totalRating), color: ColorHelper.goodColor,),
              CustomRatingBar(title: 'سئ', percent: (context.read<ProductCubit>().productRatingMap[2]!)/(context.read<ProductCubit>().totalRating), color: ColorHelper.badColor,),
              CustomRatingBar(title: 'سئ جدا', percent: (context.read<ProductCubit>().productRatingMap[1]!)/(context.read<ProductCubit>().totalRating), color: ColorHelper.veryBadColor,),
            ],
          ),
        );
      }
    );
  }
}
