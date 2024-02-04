import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CreateComment extends StatelessWidget {
  const CreateComment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'أكتب تقييمك',
                style: TextStyleHelper.font18Medium.copyWith(
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 26,
                itemBuilder: (BuildContext context, int index) {
                  return const Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 210, 51, 1),
                  );
                },
                onRatingUpdate: (double value) {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            maxLines: null,
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
          ),
          const SizedBox(height: 20),
          ActionButton(
            onTap: () {},
            label: 'ارسال',
            outerColor: ColorHelper.primaryColor,
            labelColor: Colors.white,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
