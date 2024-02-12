import 'package:final_project/features/market/ui/item_details_widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.firstTap, required this.secondTap, required this.screens, this.horizontalPadding});

  final String firstTap;
  final String secondTap;
  final List<Widget> screens;
  final double? horizontalPadding;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int currentPart = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: widget.horizontalPadding!),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPart = 1;
                    });
                  },
                  child: NavBarItem(
                    label: widget.firstTap ,
                    active: currentPart == 1 ? true : false,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentPart = 0;
                    });
                  },
                  child: NavBarItem(
                    label: widget.secondTap ,
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
        widget.screens[currentPart],
      ],
    );
  }
}
