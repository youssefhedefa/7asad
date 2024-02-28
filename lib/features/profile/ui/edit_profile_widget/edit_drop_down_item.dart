import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:flutter/material.dart';

class EditDropDownItem extends StatefulWidget {
  const EditDropDownItem({super.key, required this.label, this.width, required this.hintText, this.controller, this.haveValue = true, required this.menuItems, this.onSelected});

  final String label;
  final double? width;
  final String hintText;
  final TextEditingController? controller;
  final bool? haveValue;
  final List menuItems;
  final void Function(int?)? onSelected;

  @override
  State<EditDropDownItem> createState() => _EditDropDownItemState();
}

class _EditDropDownItemState extends State<EditDropDownItem> {
  int selectedValue = -1;

  OutlineInputBorder defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorHelper.darkGreenColor,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  OutlineInputBorder focusedBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorHelper.primaryColor,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  OutlineInputBorder errorBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorHelper.errorColor,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyleHelper.font16MediumDarkestGreen,
        ),
        const SizedBox(height: 8,),
        SizedBox(
          height: 50,
          child: DropdownMenu(
            menuHeight: 250,
            controller: widget.controller,
            onSelected: widget.onSelected,
            hintText: widget.hintText,
            textStyle: TextStyleHelper.font16MediumDarkestGreen,
            width: widget.width ?? MediaQuery.sizeOf(context).width - 32,
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyleHelper.font14RegularDarkGreen,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 11,
              ),
              border: widget.haveValue! ? defaultBorder : errorBorder,
              errorBorder:  errorBorder,
              enabledBorder: widget.haveValue! ? defaultBorder : errorBorder,
              focusedBorder: focusedBorder,
            ),
            dropdownMenuEntries: dropDownItemMaker(items: widget.menuItems),
            // dropdownMenuEntries: [
            //   DropdownMenuEntry(
            //     value: 0,
            //     label: 'مهندس زراعي',
            //     labelWidget: Text(
            //       'مهندس زراعي',
            //       style: TextStyleHelper.font16MediumDarkestGreen,
            //     ),
            //   ),
            //   DropdownMenuEntry(
            //     value: 1,
            //     label: 'مزارع',
            //     labelWidget: Text(
            //       'مزارع',
            //       style: TextStyleHelper.font16MediumDarkestGreen,
            //     ),
            //   ),
            //   DropdownMenuEntry(
            //     value: 2,
            //     label: 'استشاري أمراض',
            //     labelWidget: Text(
            //       'استشاري أمراض',
            //       style: TextStyleHelper.font16MediumDarkestGreen,
            //     ),
            //   ),
            //   DropdownMenuEntry(
            //     value: 3,
            //     label: 'طالب',
            //     labelWidget: Text(
            //       'طالب',
            //       style: TextStyleHelper.font16MediumDarkestGreen,
            //     ),
            //   ),
            //   DropdownMenuEntry(
            //     value: 4,
            //     label: 'دكتور جامعة',
            //     labelWidget: Text(
            //       'دكتور جامعة',
            //       style: TextStyleHelper.font16MediumDarkestGreen,
            //     ),
            //   ),
            //   DropdownMenuEntry(
            //     value: 5,
            //     label: 'باحث',
            //     labelWidget: Text(
            //       'باحث',
            //       style: TextStyleHelper.font16MediumDarkestGreen,
            //     ),
            //   ),
            //   DropdownMenuEntry(
            //     value: 6,
            //     label: 'مرشد زراعي',
            //     labelWidget: Text(
            //       'مرشد زراعي',
            //       style: TextStyleHelper.font16MediumDarkestGreen,
            //     ),
            //   ),
            // ],
          ),
        ),
        const SizedBox(height: 16,),
      ],
    );
  }
  List<DropdownMenuEntry<int>> dropDownItemMaker({required List items}){
    List<DropdownMenuEntry<int>> dropDownItems = [];

    for(int i = 0 ; i < items.length ; i++){
      dropDownItems.add(DropdownMenuEntry(
        value: i,
        label: items[i],
        labelWidget: Text(
          items[i].toString(),
          style: TextStyleHelper.font16MediumDarkestGreen,
        ),

      ));
    }

    return dropDownItems;
  }
}
