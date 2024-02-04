// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   File? _image;
//
//   final imagePicker = ImagePicker();
//
//   @override
//   void initState() {
//     super.initState();
//     getImage();
//   }
//
//   Future getImage() async{
//     final image = await imagePicker.pickImage(
//       source: ImageSource.camera,
//     );
//     setState(() {
//       _image = File(image!.path);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: IconButton(
//         onPressed: getImage,
//         icon: const Icon(Icons.add_a_photo),
//       ),
//       body: _image == null ? const Text('data') : Image.file(_image!),
//     );
//   }
// }

// import 'package:final_project/core/theming/text_style_helper.dart';
// import 'package:flutter/material.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
//}

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   bool flag = false;

//late AnimationController _galleryController;
//late Animation<Offset> _galleryAnimation;

// late AnimationController _cameraController;
// late Animation<Offset> _cameraAnimation;
//
// @override
// void initState() {
//   super.initState();

// Create an animation controller
// _galleryController = AnimationController(
//   duration: const Duration(milliseconds: 800),
//   vsync: this,
// );

// Create a Tween animation that animates the position
// _galleryAnimation = Tween<Offset>(
//   begin: const Offset(0.0, 0.0),
//   end: const Offset(0.0, -1.2),
// ).animate(_galleryController);

// Create an animation controller
//     _cameraController = AnimationController(
//       duration: const Duration(milliseconds: 850),
//       vsync: this,
//     );
//
//     // Create a Tween animation that animates the position
//     _cameraAnimation = Tween<Offset>(
//       begin: const Offset(0.0, 0.0),
//       end: const Offset(0.0, -2.4),
//     ).animate(_cameraController);
//
//     // Start the animation when the widget is initialized
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 300,
//           width: 300,
//           child: Center(
//             child: Column(
//               children: [
//                 SizedBox(
//                   width: 250,
//                   height: 250,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // Button 1
//                       GestureDetector(
//                         onTap: () {
//                           // Handle tap for Button 1
//                           //print('Button 1 tapped');
//                         },
//                         child: SlideTransition(
//                             position: _cameraAnimation,
//                           child: Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                       // Button 2
//                       Positioned(
//                         top: 0,
//                         right: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Handle tap for Button 2
//                             //print('Button 2 tapped');
//                             _cameraController.forward();
//                           },
//                           child: Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                       // Button 3
//                       Positioned(
//                         bottom: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Handle tap for Button 3
//                             //print('Button 3 tapped');
//                           },
//                           child: Container(
//                             width: 50,
//                             height: 50,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   'المسح الضوئي',
//                   style: TextStyleHelper.font12RegularDarkGreen,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// onTap: (){
//   //Navigator.pushNamed(context, RoutesManager.diseaseDetectionScreen);
//   setState(() {
//     flag = !flag;
//   });
// },

import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/seller_contacts_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlert(context);
          },
          child: const Text('Show Alert'),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(
                        IconHelper.deleteIcon,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                child: Image.asset(
                  ImageHelper.mohamedImage,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'محمد الشوال',
                style: TextStyleHelper.font22MediumDarkestGreen,
              ),
              Text(
                'تاجر قمح \\ كفرالشيخ',
                style: TextStyleHelper.font12RegularDarkGreen,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SellerContactsButtons(),
                ],
              ),
            ],
          ),

          // actions: [
          //   // TextButton(
          //   //   child: const Text("Close"),
          //   //   onPressed: () {
          //   //     Navigator.of(context).pop();
          //   //   },
          //   // ),
          // ],
        );
      },
    );
  }
}
