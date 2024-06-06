import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/models/default_user.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/core/widgets/seller_contacts_buttons.dart';
import 'package:final_project/features/market/data/models/product/add_product_to_cart_request.dart';
import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/item_details/details_description.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/item_details/details_title.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/quantity_row/quantity_row.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.product});

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsTitle(
            title: product.name!,
            available: product.amount!.toString(),
          ),
          const SizedBox(height: 8),
          DetailsDescription(
            description: product.description!,
          ),
          const SizedBox(height: 14),
          Text(
            'البائع',
            style: TextStyleHelper.font18MediumDarkestGreen,
          ),
          SellerInfo(
            user: product.user ?? defaultUser(),
          ),
          const SizedBox(height: 14),
          QuantityRow(
            price: product.oneItemPrice!.toDouble(),
          ),
          const SizedBox(height: 14),
          ActionButton(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return customAlert(context: context);
                },
              );
            },
            label: 'شراء الأن',
            outerColor: ColorHelper.primaryColor,
            labelColor: Colors.white,
          ),
          const SizedBox(height: 12),
          BlocConsumer<ProductCubit, ProductState>(
            builder: (context, state) {
              return ActionButton(
                label: label(state: state, context: context, id: product.id!),
                onTap: () {
                  if (!context
                      .read<ProductCubit>()
                      .cartProductsId
                      .contains(product.id!)) {
                    context.read<ProductCubit>().addProductToCart(
                          addToCartRequest: AddToCartRequest(
                            product: [product.id!],
                            quantity: 1,
                          ),
                        );
                  } else {
                    Navigator.pushNamed(context, RoutesManager.cartScreen);
                  }
                },
                outerColor: Colors.white,
                labelColor: ColorHelper.primaryColor,
              );
            },
            listener: (context, state) {
              if (state is SuccessAddCartProduct) {
                Navigator.pushNamed(context, RoutesManager.cartScreen);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: ColorHelper.successfulColor,
                      ),
                      child: Text(
                        'تمت اضافتها لعربه التسوق',
                        style: TextStyleHelper.font16RegularDis
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    backgroundColor: ColorHelper.screenBackgroundColor,
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.up,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.sizeOf(context).height - 140,
                    ),
                    elevation: 0,
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }

  Widget returnImage(BuildContext context) {
    if (product.user == null) {
      return Container(
        height: 120,
        width: 120,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageHelper.mohamedImage),
          ),
        ),
      );
    } else {
      if (product.user!.photo!.isEmpty) {
        return Container(
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(ImageHelper.mohamedImage),
            ),
          ),
        );
      } else {
        return Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(product.user!.photo!),
            ),
          ),
        );
      }
    }
  }

  AlertDialog customAlert({required BuildContext context}) {
    return AlertDialog(
      backgroundColor: ColorHelper.screenBackgroundColor,
      surfaceTintColor: ColorHelper.screenBackgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                  color: ColorHelper.errorColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          returnImage(context),
          const SizedBox(height: 12),
          Text(
            product.user == null ? ' البائع ملوش اسم' : product.user!.name!,
            style: TextStyleHelper.font22MediumDarkestGreen,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SellerContactsButtons(
                phoneOnTap: () async {
                  String phoneNumber = product.user == null
                      ? '01004176659'
                      : product.user!.phone!;
                  final Uri uri = Uri.parse('tel:$phoneNumber');
                  if (phoneNumber.isNotEmpty) {
                    await launchUrl(uri);
                  } else {
                    throw 'لا يوجد رقم هاتف';
                  }
                },
                messageOnTap: () {
                  Navigator.pushNamed(context, RoutesManager.chatBodyScreen);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String label(
      {required ProductState<dynamic> state,
      required BuildContext context,
      required String id}) {
    if (state is LoadingAddCartProduct) {
      return 'يتم الاضافه ';
    } else if (state is SuccessAddCartProduct) {
      return 'تمت اضافتها لعربه التسوق';
    } else if (context.read<ProductCubit>().cartProductsId.contains(id)) {
      return 'تمت اضافتها لعربه التسوق';
    } else {
      return 'اضافه الى عربة التسوق';
    }
  }
}
