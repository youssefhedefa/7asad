import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/models/default_user.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/data/models/product/favorit_response.dart';
import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
          title: 'المفضلة',
        hasLeading: true,
        background: Colors.white,
      ),
      body: BlocProvider.value(
        value: getIt<ProductCubit>()..getFavouriteProducts(),
        child: BlocConsumer<ProductCubit,ProductState>(
          builder: (context,state) {
            if(state is LoadingFavouriteProducts || state is LoadingDeleteFavouriteProduct){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is Error){
              return Center(
                child: Text(
                    ' حدث خطأ ما يرجى المحاولة مرة اخرى',
                    style : TextStyleHelper.font22MediumDarkestGreen
                ),
              );
            }
            else if(context.read<ProductCubit>().favouriteProducts.isNotEmpty){
              return Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: (){
                      ProductData product =  favToProductData(context.read<ProductCubit>().favouriteProducts[index]);
                      Navigator.pushNamed(context,RoutesManager.itemDetailScreen,arguments: product);
                    },
                    child: CartItem(
                      imageUrl: context.read<ProductCubit>().favouriteProducts[index].product!.photo[0],
                      title: context.read<ProductCubit>().favouriteProducts[index].product!.name ?? '',
                      quantity: context.read<ProductCubit>().favouriteProducts[index].product!.amount.toString(),
                      price: context.read<ProductCubit>().favouriteProducts[index].product!.price.toString(),
                      id: context.read<ProductCubit>().favouriteProducts[index].id ?? '',
                      isFavourite: true,
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: context.read<ProductCubit>().favouriteProducts.length,
                ),
              );
            }
            return Center(
              child: Text(
                  'لا يوجد منتجات مفضلة',
                  style : TextStyleHelper.font22MediumDarkestGreen
              ),
            );
          },
          listener: (context,state){
            if(state is SuccessDeleteFavouriteProduct){
              context.read<ProductCubit>().getFavouriteProducts();
              context.read<ProductCubit>().getAllProducts();
            }
          },
        ),
      ),
    );
  }

  ProductData favToProductData(Favorite fav){
    return ProductData(
      id: fav.product!.id ?? '',
      name: fav.product!.name,
      price: fav.product!.price,
      amount: fav.product!.amount,
      photo: fav.product!.photo,
      //user: fav.product.user ?? defaultUser(),
      user: defaultUser(),
      description: fav.product!.description,
      place: fav.product!.place,
      oneItemPrice: fav.product!.oneItemPrice,
      discount: fav.product!.discount,
      priceAfterDiscount: fav.product!.priceAfterDiscount,
      categoryName: fav.product!.categoryName,
      date: fav.product!.date,
      v: fav.v,
    );
  }


}
