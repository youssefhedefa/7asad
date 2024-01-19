import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/features/market/data/section_model.dart';
import 'package:flutter/material.dart';
import 'custom_item.dart';

class SectionPart extends StatefulWidget {
  const SectionPart({super.key});

  @override
  State<SectionPart> createState() => _SectionPartState();
}

class _SectionPartState extends State<SectionPart> {
  List<SectionModel> sectionModel = [
    SectionModel(label: 'محاصيل', icon: IconHelper.cornIcon),
    SectionModel(label: 'منتجات حيوانية', icon: IconHelper.animalIcon),
    SectionModel(label: 'تقاوي', icon: IconHelper.seedsIcon),
    SectionModel(label: 'خضار', icon: IconHelper.vegetablesIcon),
    SectionModel(label: 'منتجات البان', icon: IconHelper.dairyIcon),
    SectionModel(label: 'معدات زراعية', icon: IconHelper.agriEquIcon),
    SectionModel(label: 'أدوات زراعية', icon: IconHelper.agriToolsIcon),
    SectionModel(label: 'أدوية', icon: IconHelper.medicienIcon),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.12,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => CustomItem(model: sectionModel[index]),
        separatorBuilder: (context,index) => const SizedBox(width: 10),
        itemCount: sectionModel.length,
      ),
    );
  }
}
