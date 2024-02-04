import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_floating_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  XFile? _imageGallareyFile;
  XFile? _imageCameraFile;

  Future<void> _pickImageFromGallarey() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image!.path.isNotEmpty) {
      setState(() {
        _imageGallareyFile = image;
      });
    }
  }

  Future<void> getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _imageCameraFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          SpeedDial(
            openCloseDial: ValueNotifier(true),
            backgroundColor: Colors.transparent,
            elevation: 0,
            overlayOpacity: 0,
            overlayColor: Colors.transparent,
            renderOverlay: false,
            //animationDuration: const Duration(microseconds: 1),
            //curve: Curves.easeOutSine,
            //animationCurve: Curves.linear,
            children: [
              SpeedDialChild(
                backgroundColor: Colors.transparent,
                elevation: 0,
                onTap: () async {
                  await _pickImageFromGallarey();
                  if (context.mounted) {
                    Navigator.pushNamed(
                      context,
                      RoutesManager.diseaseDetectionScreen,
                      arguments: _imageGallareyFile,
                    );
                  }
                },
                child: const CustomFloatingButton(
                  image: IconHelper.gallereyIcon,
                  borderColor: ColorHelper.primaryColor,
                  backGroundColor: ColorHelper.cardBackgroundColor,
                  ratio: 22,
                ),
              ),
              SpeedDialChild(
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Colors.transparent,
                onTap: () async {
                  await getImageFromCamera();
                  if (context.mounted) {
                    Navigator.pushNamed(
                      context,
                      RoutesManager.diseaseDetectionScreen,
                      arguments: _imageCameraFile,
                    );
                  }
                },
                child: const CustomFloatingButton(
                  image: IconHelper.cameraIcon,
                  borderColor: ColorHelper.primaryColor,
                  backGroundColor: ColorHelper.cardBackgroundColor,
                  ratio: 22,
                ),
              ),
            ],
            child: const CustomFloatingButton(
              image: IconHelper.scanIcon,
              borderColor: ColorHelper.primaryColor,
              backGroundColor: ColorHelper.primaryColor,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'المسح الضوئي',
            style: TextStyleHelper.font12RegularDarkGreen,
          ),
        ],
      ),
    );
  }
}

// bool flag = false;
//
// late AnimationController _galleryController;
// late Animation<Offset> _galleryAnimation;
//
// late AnimationController _cameraController;
// late Animation<Offset> _cameraAnimation;
//
// @override
// void initState() {
//   super.initState();
//
//   // Create an animation controller
//   _galleryController = AnimationController(
//     duration: const Duration(milliseconds: 800),
//     vsync: this,
//   );
//
//   // Create a Tween animation that animates the position
//   _galleryAnimation = Tween<Offset>(
//     begin: const Offset(0.0, 0.0),
//     end: const Offset(0.0, -1.2),
//   ).animate(_galleryController);
//
//   // Create an animation controller
//   _cameraController = AnimationController(
//     duration: const Duration(milliseconds: 850),
//     vsync: this,
//   );
//
//   // Create a Tween animation that animates the position
//   _cameraAnimation = Tween<Offset>(
//     begin: const Offset(0.0, 0.0),
//     end: const Offset(0.0, -2.4),
//   ).animate(_cameraController);
//
//   // Start the animation when the widget is initialized
// }
//

// @override
// Widget build(BuildContext context) {
//   return SizedBox(
//     height: 66,
//     child: Column(
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             GestureDetector(
//               onTap: (){
//                 print('object');
//               },
//               child: SlideTransition(
//                 position: _cameraAnimation,
//                 child: CustomFloatingButton(
//                   image: IconHelper.cameraIcon,
//                   borderColor: ColorHelper.primaryColor,
//                   backGroundColor: ColorHelper.cardBackgroundColor,
//                   ratio: 22,
//                   onTap: () {
//                     print('camera');
//                   },
//                 ),
//               ),
//             ),
//             SlideTransition(
//               position: _galleryAnimation,
//               child: CustomFloatingButton(
//                 image: IconHelper.gallereyIcon,
//                 borderColor: ColorHelper.primaryColor,
//                 backGroundColor: ColorHelper.cardBackgroundColor,
//                 ratio: 22,
//                 onTap: () {
//                   print(5);
//                   _pickImages();
//                   print(_imageFiles!.path);
//                   if (context.mounted){
//                     Navigator.pushNamed(context, RoutesManager.diseaseDetectionScreen,arguments: _imageFiles);
//                   }
//                 },
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (!flag) {
//                     flag = !flag;
//                     _galleryController.forward();
//                     _cameraController.forward();
//                   } else {
//                     flag = !flag;
//                     _galleryController.reverse();
//                     _cameraController.reverse();
//                   }
//                 });
//               },
//               child: CustomFloatingButton(
//                 image: IconHelper.scanIcon,
//                 borderColor: ColorHelper.primaryColor,
//                 backGroundColor: ColorHelper.primaryColor,
//                 onTap: () {
//                   setState(() {
//                     if (!flag) {
//                       flag = !flag;
//                       _galleryController.forward();
//                       _cameraController.forward();
//                     } else {
//                       flag = !flag;
//                       _galleryController.reverse();
//                       _cameraController.reverse();
//                     }
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 2),
//         Text(
//           'المسح الضوئي',
//           style: TextStyleHelper.font12RegularDarkGreen,
//         ),
//       ],
//     ),
//   );
// }
