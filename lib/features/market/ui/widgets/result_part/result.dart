import 'package:flutter/material.dart';
import 'result_item.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index)=> const ResultItem(),
      itemCount: 10,
    );
  }
}
