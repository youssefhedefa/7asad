import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({super.key, required this.title, required this.quantity, required this.price, required this.id, required this.isFavourite});

  final String title;
  final String quantity;
  final String price;
  final String id;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 title,
                  style: TextStyleHelper.font16MediumDarkestGreen,
                ),
                const SizedBox(height: 2,),
                Text(
                  ' العدد:$quantity طن  ',
                  style: TextStyleHelper.font14RegularDarkGreen,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: (){
                if(isFavourite){
                  context.read<ProductCubit>().deleteFavouriteProduct(id : id);
                }
                else{
                  context.read<ProductCubit>().deleteProductFromCart(id: id);
                }
              },
              child: SizedBox(
                height: 12,
                width: 12,
                child: Image.asset(
                  IconHelper.deleteIcon,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 8,),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'طن\\جم$price',
              style: TextStyleHelper.font14MediumDarkestGreen.copyWith(color: ColorHelper.primaryColor),
            ),
            // const Spacer(),
            // CustomGetButton(
            //   height: 4,
            //   width: 16,
            //   onTap: (){
            //     showAlertContact(context,phoneNumber);
            //   },
            // ),
          ],
        ),
      ],
    );
  }
}
