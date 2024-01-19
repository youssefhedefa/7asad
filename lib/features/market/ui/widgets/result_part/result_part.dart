import 'package:flutter/material.dart';
import 'result.dart';
import 'result_label.dart';

class ResultPart extends StatelessWidget {
  const ResultPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ResultLabel(),
        SizedBox(height: 8),
        Result(),
      ],
    );
  }
}
