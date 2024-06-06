import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/features/market/data/section_model.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/item_type_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTypeList extends StatefulWidget {
  const ItemTypeList({super.key});

  @override
  State<ItemTypeList> createState() => _ItemTypeListState();
}

class _ItemTypeListState extends State<ItemTypeList> {

  List<SectionModel> sectionModel = [
    SectionModel(
      label: 'محاصيل',
      icon: IconHelper.cornIcon,
      isSelected: false,
    ),
    SectionModel(
      label: 'فاكهة',
      icon: IconHelper.fruitIcon,
      isSelected: false,
    ),
    SectionModel(
      label: 'منتجات حيوانية',
      icon: IconHelper.animalIcon,
      isSelected: false,
    ),
    SectionModel(
      label: 'تقاوي',
      icon: IconHelper.seedsIcon,
      isSelected: false,
    ),
    SectionModel(
      label: 'خضار',
      icon: IconHelper.vegetablesIcon,
      isSelected: false,
    ),
    SectionModel(
      label: 'منتجات البان',
      icon: IconHelper.dairyIcon,
      isSelected: false,
    ),
    SectionModel(
      label: 'معدات زراعية',
      icon: IconHelper.agriEquIcon,
      isSelected: false,
    ),
    SectionModel(
        label: 'أدوات زراعية',
        icon: IconHelper.agriToolsIcon,
        isSelected: false),
    SectionModel(
      label: 'أدوية',
      icon: IconHelper.medicienIcon,
      isSelected: false,
    ),
  ];

  int currentSelect = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            currentSelect = index;
            setState(() {
            });
            context.read<ProductCubit>().selectedCategory =
                sectionModel.elementAt(currentSelect).label;
            print(context.read<ProductCubit>().selectedCategory);
          },
          child: ItemTypeRow(
            label: sectionModel[index].label,
            icon: sectionModel[index].icon,
            selected: currentSelect == index ? true : false,
          ),
        );
      },
      itemCount: sectionModel.length,
    );
  }
}
