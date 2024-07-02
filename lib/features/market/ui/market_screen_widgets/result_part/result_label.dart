import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultLabel extends StatelessWidget {
  const ResultLabel({super.key, });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 18,start: 18,top: 12,),
      child: BlocBuilder<ProductCubit,ProductState>(
        builder: (context,state) {
          return Row(
            children: [
              Text(
                  context.read<ProductCubit>().label,
                style: TextStyleHelper.font22RegularDarkestGreen,
              ),
              const Spacer(),
              // const FilterIcon(
              //   padding: EdgeInsets.zero,
              //   height: 36,
              //   hasShadow: false,
              // ),
            ],
          );
        }
      ),
    );
  }
}
