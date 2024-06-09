import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/data/models/product/add_to_favorit_request.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'result_item.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductState>(
      bloc: context.read<ProductCubit>()..getAllProducts()..getFavouriteProducts(),
      builder: (context,state){
        if( state is Error || state is SuccessChangeMainImageIndex || state is SuccessSearchProduct || state is SuccessFavouriteProducts || state is SuccessAllProduct || state is SuccessProductsByCategory || state is SuccessAddReview || state is SuccessReviews || state is SuccessProductsByCategory || state is SuccessSingleProduct || state is SuccessAddProduct || state is SuccessAddFavouriteProduct || state is LoadingAddFavouriteProduct || state is SuccessCartProducts || state is ReviewsError){
          if(context.read<ProductCubit>().products.isNotEmpty){
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ResultItem(
                favoriteIcon: Positioned(
                  left: -10,
                  top: -10,
                  child: IconButton(
                    onPressed: () {
                      if(!context.read<ProductCubit>().favProductsId.contains(context.read<ProductCubit>().products[index].id)){
                        context.read<ProductCubit>().addFavouriteProduct(addToFavoriteRequest:
                          AddToFavoriteRequest(product: context.read<ProductCubit>().products[index].id!,),);
                      }
                    },
                    icon: Icon(
                      context.read<ProductCubit>().favProductsId.contains(context.read<ProductCubit>().products[index].id) == true ? Icons.favorite : Icons.favorite_border_outlined,
                      color: ColorHelper.errorColor,
                    ),
                  ),
                ),
                product: context.read<ProductCubit>().products[index],
              ),
              itemCount: context.read<ProductCubit>().products.length,
            );
          }
          else{
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'عفوا لا يوجد منتجات حاليا',
                  style: TextStyleHelper.font18MediumDarkestGreen,
                ),
              ),
            );
          }
        }
        else if( state is LoadingFavouriteProducts || state is LoadingAllProduct || state is LoadingProductsByCategory || state is LoadingAddReview || state is LoadingReviews || state is LoadingProductsByCategory || state is LoadingSingleProduct || state is LoadingAddProduct || state is ChangeSelectedCategory || state is LoadingFavouriteProducts ){
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
              color: Colors.white,
            ),
          );
        }
        else{
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                  'عفوا لا يوجد منتجات حاليا',
                style: TextStyleHelper.font18MediumDarkestGreen,
              ),
            ),
          );
        }
      },
    );
  }
}
