import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStart extends StatelessWidget {
  const RatingStart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductState>(
      builder: (context,state) {
        return Align(
          alignment: Alignment.center,
          child: Column(
            children: [
               Text(
                context.read<ProductCubit>().totalRating.toString(),
                style: const TextStyle(fontSize: 36),
              ),
              RatingBar.builder(
                initialRating: context.read<ProductCubit>().totalRating.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemBuilder: (BuildContext context, int index) {
                  return const Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 210, 51, 1),
                  );
                },
                ignoreGestures: true,
                onRatingUpdate: (double value) {},
              ),
              const SizedBox(height: 8,),
              Text(
                'بناءا على ${context.read<ProductCubit>().reviews.length} تقييم',
                style: TextStyleHelper.font14RegularDarkGreen,
              ),
            ],
          ),
        );
      }
    );
  }
}
