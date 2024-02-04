import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/scan/ui/widgets/disease_detection/medicien_item.dart';
import 'package:flutter/material.dart';

class MedicienList extends StatelessWidget {
  const MedicienList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_,index)=> GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, RoutesManager.medicienDetailsScreen);
          },
            child: const MedicienItem(),
        ),
      separatorBuilder: (_,index)=> const SizedBox(height: 8,),
      itemCount: 3,
    );
  }
}
