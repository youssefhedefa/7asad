import 'package:final_project/features/market/ui/item_details_widgets/other_image_item.dart';
import 'package:flutter/material.dart';

class OtherItemDetailsImages extends StatelessWidget {
  const OtherItemDetailsImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ((MediaQuery.sizeOf(context).width - 100) / 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,index) => const OtherImageItem(),
            separatorBuilder:  (_,index) => const SizedBox(width: 12,),
          itemCount: 5,
        ),
      ),
    );
  }
}

