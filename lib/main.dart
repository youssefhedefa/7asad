import 'package:final_project/hasad_app.dart';
import 'package:final_project/bloc_observer.dart';
import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/networking/local/hive/constance.dart';
import 'package:final_project/core/routing/app_router.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/scan/data/models/diseases_info.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'firebase_options.dart';
//import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DiseaseDataClassification.loadJsonData();
  await setUpSetIt();
  await CachHelper.init();
  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(ExperinceAdapter());
  Hive.registerAdapter(UserAdapter());
  LocalBox.userBox = await Hive.openLazyBox<User>(BoxConstance.userBox);
  LocalBox.exprienceBox =
      await Hive.openLazyBox<List<Experince>>(BoxConstance.experinceBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider(
      create: (context) => getIt<ProductCubit>(),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );

  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(appRouter: AppRouter()), // Wrap your app
  //   ),
  // );
}
