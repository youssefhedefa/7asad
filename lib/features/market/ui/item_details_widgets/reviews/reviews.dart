import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/comments/comment_list.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/comments/create_comment.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/custom_divider.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/rating_bar.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/rating_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key, required this.product});

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductState>(
      bloc: getIt<ProductCubit>()..getProductReviews(id: product.id!),
      builder: (context,state){
        if(state is LoadingAddReview || state is LoadingReviews){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RatingStart(),
              const CustomRatingBars(),
              const CustomDivider(),
              CommentList(
                reviews: context.read<ProductCubit>().reviews,
              ),
              const CustomDivider(),
              CreateComment(
                id: product.id!,
              ),
            ],
          ),
        );
      },
    );
  }
}
