import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:final_project/features/market/data/models/reviews/review_request.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/logic/product_cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CreateComment extends StatelessWidget {
  const CreateComment({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductState>(
      builder: (context,state) {
        if(state is LoadingAddReview){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'أكتب تقييمك',
                    style: TextStyleHelper.font18MediumWhite.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  RatingBar.builder(
                    initialRating: 1,
                    minRating: 1,
                    maxRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 26,
                    itemBuilder: (BuildContext context, int index) {
                      return const Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 210, 51, 1),
                      );
                    },
                    onRatingUpdate: (double value) {
                      context.read<ProductCubit>().productRating = value.toInt();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              commentField(context),
              const SizedBox(height: 20),
              ActionButton(
                onTap: () {
                  if(context.read<ProductCubit>().addCommentController.text.isNotEmpty) {
                    context.read<ProductCubit>().addProductReview(
                      id: id,
                      reviewRequestModel: ReviewRequestModel(
                        rating: context.read<ProductCubit>().productRating,
                        review: context.read<ProductCubit>().addCommentController.text,
                      ),
                    );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'الرجاء كتابة تعليق',
                          style: TextStyleHelper.font14RegularDarkGreen,
                        ),
                        backgroundColor: const Color.fromRGBO(255, 210, 51, 1),
                      ),
                    );
                  }
                },
                label: 'ارسال',
                outerColor: ColorHelper.primaryColor,
                labelColor: Colors.white,
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
      listener: (context,state){
        if(state is SuccessAddReview){
          context.read<ProductCubit>().getProductReviews(id: id);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'تم إضافة التعليق بنجاح',
                style: TextStyleHelper.font14RegularDarkGreen,
              ),
              backgroundColor: const Color.fromRGBO(255, 210, 51, 1),
            ),
          );
        }
        else if(state is Error){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                style: TextStyleHelper.font14RegularDarkGreen,
              ),
              backgroundColor: const Color.fromRGBO(255, 210, 51, 1),
            ),
          );
        }
      },
    );
  }

  Widget commentField(BuildContext context){
    return TextField(
      maxLines: null,
      controller: context.read<ProductCubit>().addCommentController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(230, 224, 233, 1),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(230, 224, 233, 1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(230, 224, 233, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(230, 224, 233, 1),
          ),
        ),
        hintText: ' أكتب هنا.....',
        hintStyle: TextStyleHelper.font14RegularDarkGreen.copyWith(
          color: const Color.fromRGBO(230, 224, 233, 1),
        ),
      ),
    );
  }

}
