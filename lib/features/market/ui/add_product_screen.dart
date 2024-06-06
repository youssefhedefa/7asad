import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/data/models/product/add_product_request.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/add_item_image.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/item_info.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/item_type_list.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProductCubit>(),
      child: BlocConsumer<ProductCubit,ProductState>(
        builder: (context,state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomAppBar(
              title: 'بيع منتجك',
              hasLeading: true,
              background: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: context.read<ProductCubit>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32.0,
                        bottom: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: Text(
                        'نوع المنتج',
                        style: TextStyleHelper.font16BoldDarkestGreen,
                      ),
                    ),
                    const ItemTypeList(),
                    const SizedBox(height: 12),
                    ItemInfo(
                      errorText: 'الرجاء ادخال اسم المنتج',
                      label: 'اسم المنتج',
                      isMultiLine: true,
                      //height: 40,
                      controller:
                          context.read<ProductCubit>().productNameController,
                    ),
                    ItemInfo(
                      errorText: 'الرجاء ادخال المكان',
                      label: 'المكان',
                      isMultiLine: true,
                      //height: 40,
                      controller:
                          context.read<ProductCubit>().productLocationController,
                    ),
                    ItemInfo(
                      errorText: 'الرجاء ادخال الوصف',
                      label: 'الوصف',
                      isMultiLine: true,
                      //height: 40,
                      controller:
                          context.read<ProductCubit>().productDescriptionController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ItemInfo(
                            errorText: 'الرجاء ادخال السعر',
                            label: 'سعر الواحد',
                            //height: 40,
                            keyBordTyp: const TextInputType.numberWithOptions(
                                decimal: true),
                            isMultiLine: false,
                            controller:
                                context.read<ProductCubit>().productPriceController,
                          ),
                        ),
                        const Expanded(flex: 1, child: SizedBox(width: 0)),
                        Expanded(
                          flex: 5,
                          child: ItemInfo(
                            errorText: 'الرجاء ادخال الكميه',
                            label: 'الكميه',
                            //height: 40,
                            keyBordTyp: const TextInputType.numberWithOptions(
                                decimal: true),
                            isMultiLine: false,
                            controller: context
                                .read<ProductCubit>()
                                .productAmountController,
                          ),
                        ),
                      ],
                    ),
                    const AddItemImage(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: ActionButton(
                        onTap: () {
                          print('Add Product');
                          if (context
                              .read<ProductCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            if (context.read<ProductCubit>().imagesUrl.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('الرجاء اضافة صوره واحده على الاقل'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            } else {
                              context.read<ProductCubit>().addProduct(
                                    addProductRequestModel: AddProductRequestModel(
                                      name: context
                                          .read<ProductCubit>()
                                          .productNameController
                                          .text,
                                      description: context
                                          .read<ProductCubit>()
                                          .productDescriptionController
                                          .text,
                                      price: double.parse(context
                                          .read<ProductCubit>()
                                          .productPriceController
                                          .text),
                                      amount: int.parse(context
                                          .read<ProductCubit>()
                                          .productAmountController
                                          .text),
                                      photo: context.read<ProductCubit>().imagesUrl,
                                      place: context
                                          .read<ProductCubit>()
                                          .productLocationController
                                          .text,
                                      oneItemPrice: double.parse(context
                                          .read<ProductCubit>()
                                          .productPriceController
                                          .text),
                                      discount: 0,
                                      priceAfterDiscount: double.parse(context
                                          .read<ProductCubit>()
                                          .productPriceController
                                          .text),
                                      categoryName: context
                                          .read<ProductCubit>()
                                          .selectedCategory,
                                    ),
                                  );
                            }
                          }
                        },
                        label: 'نشر الأن',
                        outerColor: ColorHelper.primaryColor,
                        labelColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context,state){
          if(state is LoadingAddProduct){
            showDialog(context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            );
          }
          if(state is SuccessAddProduct){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم اضافة المنتج بنجاح'),
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.read<ProductCubit>().getAllProducts();
            Navigator.pop(context);
            Navigator.pop(context);
          }
          if(state is Error){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('حدث خطأ ما'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
      ),
    );
  }
}
