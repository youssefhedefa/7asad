import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/cart_widgets/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'عربة التسوق',
        hasLeading: true,
        background: Colors.white,
      ),
      body: BlocProvider.value(
        //value: getIt<ProductCubit>()..getCartProducts(),
        value: getIt<ProductCubit>(),
        child: SingleChildScrollView(
          child: BlocConsumer<ProductCubit,ProductState>(
            builder: (context,state) {
              if (state is LoadingCartProducts || state is LoadingDeleteCartProduct) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  const SizedBox(height: 12),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>  GestureDetector(
                      onTap: (){
                         //ProductData product =  favToProductData(context.read<ProductCubit>().favouriteProducts[index]);
                         Navigator.pushNamed(context,RoutesManager.itemDetailScreen,arguments: context.read<ProductCubit>().cartProducts[index].product!);
                      },
                      child: CartItem(
                        imageUrl: context.read<ProductCubit>().cartProducts[index].product!.photo![0],
                        title: context.read<ProductCubit>().cartProducts[index].product!.name ?? '',
                        quantity: context.read<ProductCubit>().cartProducts[index].product!.amount.toString(),
                        price: context.read<ProductCubit>().cartProducts[index].product!.price.toString(),
                        id:  context.read<ProductCubit>().cartProducts[index].product!.id ?? '',
                        isFavourite: false,
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemCount: context.read<ProductCubit>().cartProducts.length,
                  ),
                  const SizedBox(height: 28,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'المجموع الكلي',
                              style: TextStyleHelper.font22MediumDarkestGreen,
                            ),
                            // const Spacer(),
                            // Text(
                            //   'جم 24.000',
                            //   style: TextStyleHelper.font22MediumDarkestGreen,
                            // ),
                          ],
                        ),
                        const SizedBox(height: 28,),
                        // ActionButton(
                        //   onTap: () {},
                        //   label: 'شراء الأن',
                        //   outerColor: ColorHelper.primaryColor,
                        //   labelColor: Colors.white,
                        // ),
                        // const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              );
            },
            listener: (context,state) {
              if (state is SuccessDeleteCartProduct) {
                context.read<ProductCubit>().getCartProducts();
              }
            },
          ),
        ),
      ),
    );
  }
}
