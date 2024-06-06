import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultListener extends StatelessWidget {
  const ResultListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
        listenWhen: (previous, current) =>
            current is LoadingAllProduct ||
            current is SuccessAllProduct ||
            current is Error,
        listener: (context, state) {
          state.whenOrNull(
            loadingAllProduct: () {
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    //color: ColorHelper.primaryColor,
                    backgroundColor: Colors.black,
                    color: Colors.white,
                  ),
                ),
              );
            },
            successAllProduct: (products) {
              //Navigator.pop(context);
              //context.read<ProductCubit>().products = products;
            },
          );
        },
        child: const SizedBox.shrink());
  }
}
