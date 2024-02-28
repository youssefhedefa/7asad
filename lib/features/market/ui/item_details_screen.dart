import 'package:final_project/features/market/ui/item_details_widgets/custom_item_details_app_bar.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/details.dart';
import 'package:final_project/features/market/ui/item_details_widgets/main_item_detail_image.dart';
import 'package:final_project/features/market/ui/item_details_widgets/nav_bar.dart';
import 'package:final_project/features/market/ui/item_details_widgets/other_item_row_images.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/reviews.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomItemDetailsAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          right: 18,
          left: 18,
          top: 10,
        ),
        child: Column(
          children: [
            MainItemDetailsImage(),
            SizedBox(
              height: 18,
            ),
            OtherItemDetailsImages(),
            SizedBox(
              height: 28,
            ),
            Expanded(
              child: NavBar(
                //expand here
                firstTap: 'تقيمات',
                secondTap: 'تفاصيل',
                horizontalPadding: 0,
                screens: [
                  Details(),
                  Reviews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
