import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/quantity_row/quantity.dart';
import 'package:flutter/material.dart';

class QuantityRow extends StatefulWidget {
  const QuantityRow({super.key, required this.price});

  final double price;

  @override
  State<QuantityRow> createState() => _QuantityRowState();
}

class _QuantityRowState extends State<QuantityRow> {

  late String price;

  void changeQuantity(int counter) {
    setState(() {
      price = (widget.price * counter).toString();
    });
  }

  @override
  void initState() {
    price = widget.price.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'جنيه $price',
          style: TextStyleHelper.font20BoldPrimary,
        ),
        const Spacer(),
        Quantity(
          buttonHeight: 22,
          buttonWidth: 30,
          fontSize: 22,
          changeQuantity: changeQuantity,
        ),
      ],
    );
  }
}
