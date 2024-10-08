import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:flutter/material.dart';
import 'result_item_details.dart';
import 'result_item_image.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key, this.favoriteIcon, required this.product, });

  final Widget? favoriteIcon;
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 18,
        left: 18,
        bottom: 8,
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 8,
          end: 12,
          top: 12,
          bottom: 14,
        ),
        decoration: BoxDecoration(
          color: ColorHelper.cardBackgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(1, 3),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RoutesManager.itemDetailScreen , arguments: product);
              },
              child: Row(
                children: [
                  Expanded(
                    flex: 35,
                    child: AspectRatio(
                      aspectRatio: 1.05,
                      child: ResultItemImage(
                        image: product.photo![0],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 65,
                    child: AspectRatio(
                      aspectRatio: 1.75,
                      child: ResultItemDetails(
                        product: product,
                        //productInfo: productInfo,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            favoriteIcon!,
          ],
        ),
      ),
    );
  }
}
