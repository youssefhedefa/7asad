import 'package:final_project/features/market/ui/item_details_widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar(
      {super.key,
      required this.firstTap,
      required this.secondTap,
      required this.screens,
      this.horizontalPadding});

  final String firstTap;
  final String secondTap;
  final List<Widget> screens;
  final double? horizontalPadding;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPart = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      //remove expand here
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding!),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPart = 1;
                      pageController.animateToPage(
                        currentPart,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn,
                      );
                    });
                  },
                  child: NavBarItem(
                    label: widget.firstTap,
                    active: currentPart == 1 ? true : false,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPart = 0;
                      pageController.animateToPage(
                        currentPart,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.linear,
                      );
                    });
                  },
                  child: NavBarItem(
                    label: widget.secondTap,
                    active: currentPart == 0 ? true : false,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 2,
          color: Color.fromRGBO(230, 224, 233, 1),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: PageView(
            reverse: true,
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPart = index;
              });
            },
            children: widget.screens,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
}
