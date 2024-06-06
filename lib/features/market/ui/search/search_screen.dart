import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/result_part/result_item.dart';
import 'package:final_project/features/market/ui/market_screen_widgets/upper_part/custom_search/custom_search_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: '',
        background: Colors.white,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomSearchFieldRow(
                  enabled: true,
                  onChanged: (value) {
                    context.read<ProductCubit>().searchProductsData.clear();
                    context.read<ProductCubit>().searchProducts.clear();

                    if (value.isNotEmpty) {
                      context.read<ProductCubit>().searchProductsData.clear();
                      context.read<ProductCubit>().searchProducts.clear();

                      context
                          .read<ProductCubit>()
                          .searchOnProducts(text: value);
                    } else {
                      context.read<ProductCubit>().searchProductsData.clear();
                      context.read<ProductCubit>().searchProducts.clear();
                    }
                  },
                ),
              ),
              Expanded(
                child: state is! LoadingSearchProduct
                    ? ListView.builder(
                        itemBuilder: (context, index) => ResultItem(
                          favoriteIcon: Positioned(
                            left: -10,
                            top: -10,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_outlined,
                                color: ColorHelper.errorColor,
                              ),
                            ),
                          ),
                          product: context
                              .read<ProductCubit>()
                              .searchProductsData[index],
                        ),
                        itemCount:
                            context.read<ProductCubit>().searchProducts.length,
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
