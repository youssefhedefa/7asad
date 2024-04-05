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
//
// import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
// import 'package:final_project/core/helpers/assets_helper/image_helper.dart';
// import 'package:final_project/core/theming/text_style_helper.dart';
// import 'package:final_project/core/widgets/seller_contacts_buttons.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Alert Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showAlert(context);
//           },
//           child: const Text('Show Alert'),
//         ),
//       ),
//     );
//   }
//
//   void _showAlert(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: SizedBox(
//                       height: 16,
//                       width: 16,
//                       child: Image.asset(
//                         IconHelper.deleteIcon,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 radius: 50,
//                 child: Image.asset(
//                   ImageHelper.mohamedImage,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Text(
//                 'محمد الشوال',
//                 style: TextStyleHelper.font22MediumDarkestGreen,
//               ),
//               Text(
//                 'تاجر قمح \\ كفرالشيخ',
//                 style: TextStyleHelper.font12RegularDarkGreen,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SellerContactsButtons(),
//                 ],
//               ),
//             ],
//           ),
//
//           // actions: [
//           //   // TextButton(
//           //   //   child: const Text("Close"),
//           //   //   onPressed: () {
//           //   //     Navigator.of(context).pop();
//           //   //   },
//           //   // ),
//           // ],
//         );
//       },
//     );
//   }
// }

//import 'package:final_project/features/market/ui/item_details_widgets/custom_item_details_app_bar.dart';
// import 'package:final_project/features/market/ui/item_details_widgets/nav_bar.dart';
// import 'package:flutter/material.dart';
//
// import 'features/market/ui/item_details_widgets/details/details.dart';
// import 'features/market/ui/item_details_widgets/main_item_detail_image.dart';
// import 'features/market/ui/item_details_widgets/other_item_row_images.dart';
// import 'features/market/ui/item_details_widgets/reviews/reviews.dart';
//
// class ItemProduct extends StatefulWidget {
//   const ItemProduct({super.key});
//
//   @override
//   State<ItemProduct> createState() => _ItemProductState();
// }
//
// class _ItemProductState extends State<ItemProduct> {
//
//   int currentPart = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomItemDetailsAppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const MainItemDetailsImage(),
//             const SizedBox(height: 18),
//             const OtherItemDetailsImages(),
//             const SizedBox(height: 28),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text('تقيمات'),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text('تقيمات 2'),
//                   ),
//                 ),
//               ],
//             ),
//             // Expanded(
//             //   child: SizedBox(
//             //     width: MediaQuery.of(context).size.width,
//             //     child: PageView(
//             //       allowImplicitScrolling: true,
//             //       children: [
//             //         buildTab1(),
//             //         buildTab2(),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//             IndexedStack(
//               index: currentPart,
//               children: [
//                 GestureDetector(
//                     onHorizontalDragStart:(details) {
//                       currentPart = 1;
//                       print(0);
//                       setState(() {
//                       });
//                     },
//                     child: buildTab1(),
//                     ),
//                 GestureDetector(
//                     onHorizontalDragUpdate:(details) {
//                       print(1);
//                       currentPart = 0;
//                       setState(() {
//                       });
//                     },
//                     child: buildTab2()),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildTab1() {
//     return ListView(
//       physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         children: const [
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//           Text('data'),
//         ],
//     );
//   }
//
//   Widget buildTab2() {
//     return ListView(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       children: const [
//         Reviews(),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import 'features/market/ui/item_details_widgets/details/details.dart';
// import 'features/market/ui/item_details_widgets/reviews/reviews.dart';
//
// class SlideTransitionExampleApp extends StatelessWidget {
//   const SlideTransitionExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('SlideTransition Sample')),
//         body: const Center(
//           child: SlideTransitionExample(),
//         ),
//       ),
//     );
//   }
// }
//
// class SlideTransitionExample extends StatefulWidget {
//   const SlideTransitionExample({super.key});
//
//   @override
//   State<SlideTransitionExample> createState() => _SlideTransitionExampleState();
// }
//
// class _SlideTransitionExampleState extends State<SlideTransitionExample>
//     with SingleTickerProviderStateMixin {
//
//   //create a Animation<double> animation
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     //initialize the AnimationController
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     super.initState();
//   }
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onHorizontalDragUpdate: (details) {
//         if(index == 0){
//           index = 1;
//           _controller.forward();
//           setState(() {
//           });
//         }
//         else{
//           index = 0;
//           _controller.reverse();
//           setState(() {
//           });
//         }
//       },
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 500),
//          child: buildWidget(index ,UniqueKey()),
//       ),
//     );
//   }
//   Widget buildWidget(int index , UniqueKey key) {
//     if (index == 0) {
//       return Details(key: key,);
//     } else {
//       return Reviews(key: key,);
//     }
//   }
//
// }
//

// ignore_for_file: invalid_return_type_for_catch_error, avoid_print, unused_local_variable

// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:final_project/core/component/upload_image/logic/upload_image_cubit.dart';
// import 'package:final_project/core/component/upload_image/logic/upload_image_states.dart';
// import 'package:final_project/core/component/upload_image/upload_image_listner.dart';
// import 'package:final_project/core/di/dependency_injection.dart';
// import 'package:final_project/core/helpers/assets_helper/icon_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class HomeTestScreen extends StatelessWidget {
//   const HomeTestScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: SingleTestImage(),
//       ),
//     );
//   }
// }
//
//
//
// class SingleTestImage extends StatelessWidget {
//   const SingleTestImage({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => getIt<UploadImageCubit>(),
//       child: BlocBuilder<UploadImageCubit,UploadImageState>(
//         builder: (BuildContext context, UploadImageState<dynamic> state) {
//           var cubit = context.read<UploadImageCubit>();
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () async {
//                   await cubit.pickImages();
//                   if(context.mounted) {
//                     cubit.emitUploadImageStates(
//                       cubit.image!,
//                       context,
//                     );
//                    }
//                 },
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: const Color(0xffECECEC),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child:
//                     context.read<UploadImageCubit>().imageUrl.isNotEmpty
//                       ? Image.network(context.read<UploadImageCubit>().imageUrl)
//                       : Image.asset(IconHelper.addImageIcon),
//                 ),
//               ),
//               const UploadImageListener(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// // Image.file(
// // fit: BoxFit.fill,
// // File(
// // _imageFile!.path,
// // ),
// // )
//
//
// class ImageUploader extends StatelessWidget {
//   final String endPoint = 'https://sevenasad.onrender.com/product/uploadImage';
//
//   const ImageUploader({super.key}); // Replace with your API endpoint
//
//   //final String endPoint = 'http://10.0.2.2:8000/analyze';
//   void _upload(File file) async {
//     String fileName = file.path.split('/').last;
//     print(fileName);
//
//     FormData data = FormData.fromMap({
//       "image": await MultipartFile.fromFile(
//         file.path,
//         filename: fileName,
//       ),
//     });
//
//     Dio dio = Dio();
//
//     dio.post(endPoint, data: data).then((response) {
//       var jsonResponse = jsonDecode(response.toString());
//       var testData = jsonResponse['histogram_counts'].cast<double>();
//       var averageGrindSize = jsonResponse['average_particle_size'];
//     }).catchError((error) => print(error));
//   }
//
//   // Future<void> uploadFileDio(String url, File file) async {
//   //   var formData = FormData.fromMap({
//   //     'image': await MultipartFile.fromFile(file.path),
//   //   });
//   //   Dio dio = Dio();
//   //   var response = await dio.post(url, data: formData);
//   //   if (response.statusCode == 200) {
//   //     // Upload successful
//   //     print('Image uploaded successfully');
//   //   } else {
//   //     // Handle error
//   //     print('Failed to upload image. Error::: ${response.statusMessage}');
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Uploader'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             // Open the device's image picker to select an image
//             var picker = ImagePicker();
//             final imageFile = await picker.pickImage(source: ImageSource.gallery);
//
//             if (imageFile != null) {
//               // If an image is selected, upload it to the API
//               //await uploadImage(File(imageFile.path));
//               _upload(File(imageFile.path));
//             } else {
//               print('No image selected');
//             }
//           },
//           child: const Text('Upload Image'),
//         ),
//       ),
//     );
//   }
// }


import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/features/profile/logic/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TryCubitValue extends StatelessWidget {
  const TryCubitValue({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: getIt<ProfileCubit>(),
        child: BlocBuilder<ProfileCubit, dynamic>(
          builder: (BuildContext context, state) {
            return const Text('data');
          },
        )
    );
  }
}
