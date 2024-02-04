import 'package:final_project/features/market/ui/item_details_widgets/details/details.dart';
import 'package:final_project/features/market/ui/item_details_widgets/nav_bar_item.dart';
import 'package:final_project/features/market/ui/item_details_widgets/reviews/reviews.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPart = 0;
  List<Widget> screen = const [
    Details(),
    Reviews(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentPart = 1;
                  });
                },
                child: NavBarItem(
                  label: 'تقيمات',
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
                  label: 'تفاصيل',
                  active: currentPart == 0 ? true : false,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 2,
          color: Color.fromRGBO(230, 224, 233, 1),
        ),
        const SizedBox(
          height: 30,
        ),
        screen[currentPart],
      ],
    );
  }
}
