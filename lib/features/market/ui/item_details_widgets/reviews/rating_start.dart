import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStart extends StatelessWidget {
  const RatingStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text(
            '3.5',
            style: TextStyle(fontSize: 36),
          ),
          RatingBar.builder(
            initialRating: 3.5,
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
            'بناءا على 23 تقييم',
            style: TextStyleHelper.font14RegularDarkGreen,
          ),
        ],
      ),
    );
  }
}
