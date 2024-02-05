import 'package:final_project/features/scan/ui/widgets/appointment/consultants_item.dart';
import 'package:flutter/material.dart';

class ConsultantList extends StatefulWidget {
  const ConsultantList({super.key});

  @override
  State<ConsultantList> createState() => _ConsultantListState();
}

class _ConsultantListState extends State<ConsultantList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: ConsultantsItem(
              selected: currentIndex == index,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 26,
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
