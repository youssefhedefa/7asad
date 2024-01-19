import 'package:final_project/app_main.dart';
import 'package:final_project/core/routing/app_router.dart';
import 'package:final_project/core/theming/color_helper.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:device_preview/device_preview.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorHelper.primaryColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light
    ),
  );
  runApp(
    MyApp(appRouter: AppRouter()),
  );


  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(), // Wrap your app
  //   ),
  // );

}
