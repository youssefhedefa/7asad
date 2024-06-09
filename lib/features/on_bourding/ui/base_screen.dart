import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/features/on_bourding/ui/widgets/custom_next_button.dart';
import 'package:final_project/features/on_bourding/ui/widgets/image_viewer.dart';
import 'package:final_project/features/on_bourding/ui/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBourdingScreen extends StatefulWidget {
  const OnBourdingScreen({super.key});

  @override
  State<OnBourdingScreen> createState() => _OnBourdingScreenState();
}

class _OnBourdingScreenState extends State<OnBourdingScreen> {
  final PageController pageController = PageController();
  late List<Widget> images ;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
      images = [
        const Image(
          image: AssetImage(ImageHelper.shoppingCartImage),
          fit: BoxFit.fitWidth,
        ),
        const Image(
          image: AssetImage(ImageHelper.scanImage),
        ),
        const Image(
          image: AssetImage(ImageHelper.socialMediaImage),
        ),
        const Image(
          image: AssetImage(ImageHelper.textDialogImage),
        ),
      ];
      setState(() {});
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SkipButton(),
            CustomImageViewer(
              pageController: pageController,
              children: images,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                haveNext(),
                SmoothPageIndicator(
                  textDirection: TextDirection.ltr,
                  effect: const ScrollingDotsEffect(
                    spacing: 10,
                    dotHeight: 14,
                    dotWidth: 14,
                    activeDotColor: ColorHelper.primaryColor,
                  ),
                  controller: pageController,
                  count: 4,
                ),
                havePrevious(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget havePrevious() {
    if (currentPage == 0) {
      return const SizedBox(
        width: 70,
      );
    }
    return TextButton(
      onPressed: () {
        pageController.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
      child: Text(
        'السابق',
        style: TextStyleHelper.font16MediumPrimary,
      ),
    );
  }

  Widget haveNext() {
    if (currentPage == 3) {
      return CustomNextButton(
        label: 'البدء',
        pageController: pageController,
        onPressed: () {
          Navigator.pushNamed(context, RoutesManager.signInScreen);
        },
      );
    }
    return CustomNextButton(
      label: 'التالي',
      pageController: pageController,
      onPressed: () {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
