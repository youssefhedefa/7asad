import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/quantity_row/quantity_button.dart';
import 'package:flutter/material.dart';

class Quantity extends StatefulWidget {
  const Quantity({super.key, required this.buttonWidth, required this.buttonHeight, required this.fontSize, this.buttonFontSize, this.changeQuantity});

  final double buttonWidth;
  final double buttonHeight;
  final double fontSize;
  final double? buttonFontSize;
  final Function(int)? changeQuantity;


  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          QuantityButton(
            onTap: () {
              setState(() {
                _counter++;
                widget.changeQuantity!(_counter);
              });
            },
            sign: '+',
            outerColor: ColorHelper.primaryColor,
            textColor: Colors.white,
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            buttonFontSize: widget.buttonFontSize,
          ),
          const SizedBox(width: 10,),
          Text(
            _counter.toString(),
            style: TextStyle(
                fontSize: widget.fontSize,
              color: Colors.black.withOpacity(0.65),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10,),
          QuantityButton(
            onTap: () {
              setState(() {
                _counter--;
                widget.changeQuantity!(_counter);
              });
            },
            sign: '-',
            outerColor: const Color(0xFFEAEAEA),
            textColor: ColorHelper.primaryColor,
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            buttonFontSize: widget.buttonFontSize,
          ),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}

