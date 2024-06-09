import 'package:flutter/material.dart';

class CustomImageViewer extends StatelessWidget {
  const CustomImageViewer(
      {super.key, required this.pageController, required this.children});

  final List<Widget> children;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Center(
        child: PageView(
          controller: pageController,
          reverse: true,
          children: children,
        ),
      ),
    );
  }
}