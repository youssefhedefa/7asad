import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/details.dart';
import 'package:final_project/features/market/ui/item_details_widgets/nav_bar_item.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/reviews.dart';
import 'package:flutter/material.dart';

class DetailsAndReviewsWidget extends StatefulWidget {
  const DetailsAndReviewsWidget({super.key, required this.product});

  final ProductData product;

  @override
  State<DetailsAndReviewsWidget> createState() => _DetailsAndReviewsWidgetState();
}

class _DetailsAndReviewsWidgetState extends State<DetailsAndReviewsWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: NavBarItem(
                  label: 'تقيمات',
                  active: index == 1 ? true : false,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: NavBarItem(
                  label: 'تفاصيل',
                  active: index == 0 ? true : false,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 2,
          color: Color.fromRGBO(230, 224, 233, 1),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            if(index == 0){
              index = 1;
              _controller.forward();
              setState(() {
              });
            }
            else{
              index = 0;
              _controller.reverse();
              setState(() {
              });
            }
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: buildWidget(index ,UniqueKey()),
          ),
        ),
      ],
    );
  }
  Widget buildWidget(int index , UniqueKey key) {
    if (index == 0) {
      return Details(key: key,product: widget.product,);
    } else {
      return Reviews(key: key, product: widget.product,);
    }
  }
}
