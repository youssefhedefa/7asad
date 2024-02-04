import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/features/scan/data/safety_model.dart';
import 'package:final_project/features/scan/ui/widgets/safety_item.dart';
import 'package:flutter/material.dart';

class SafetyList extends StatefulWidget {
  const SafetyList({super.key});

  @override
  State<SafetyList> createState() => _SafetyListState();
}

class _SafetyListState extends State<SafetyList> {
  List<SafetyModel> safetyModel = [
    SafetyModel(
        icon: IconHelper.faceIcon, text: 'يحفظ في مكان أمن بعيدأ عن الأطفال'),
    SafetyModel(
        icon: IconHelper.maskIcon, text: 'وضع كمامة الوجة أثنا الأستخدام'),
    SafetyModel(icon: IconHelper.glassesIcon, text: 'وضع نظارة حماية للعين'),
    SafetyModel(icon: IconHelper.handIcon, text: 'وضع قفازات لليد طويلة'),
    SafetyModel(
        icon: IconHelper.hand2Icon,
        text: 'اغسل اليد والوجه جيدا بعد الأستخدام'),
    SafetyModel(icon: IconHelper.dogIcon, text: 'هذا المنتج ضار جدا للحيونات'),
    SafetyModel(
        icon: IconHelper.fishIcon, text: 'هذا المنتج يلوث الماء ويضر الأسماك'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) => SafetyItem(
        icon: safetyModel[index].icon,
        text: safetyModel[index].text,
      ),
      itemCount: safetyModel.length,
    );
  }
}
