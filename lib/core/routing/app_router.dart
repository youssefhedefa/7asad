import 'package:final_project/core/widgets/land_screen.dart';
import 'package:final_project/features/market/ui/add_product_screen.dart';
import 'package:final_project/features/market/ui/cart_screen.dart';
import 'package:final_project/features/market/ui/favourite_screen.dart';
import 'package:final_project/features/market/ui/item_details_screen.dart';
import 'package:final_project/features/market/ui/market_screen.dart';
import 'package:final_project/features/notification/ui/notification_screen.dart';
import 'package:final_project/features/profile/ui/profile_screen.dart';
import 'package:final_project/features/scan/ui/disease_detection_screen.dart';
import 'package:final_project/features/scan/ui/medicien_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MarketScreen(),
        );

      case RoutesManager.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const LandScreen(),
        );

      case RoutesManager.marketScreen:
        return MaterialPageRoute(
          builder: (_) => const MarketScreen(),
        );

      case RoutesManager.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );

      case RoutesManager.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      case RoutesManager.itemDetailScreen:
        return MaterialPageRoute(
          builder: (_) => const ItemDetailsScreen(),
        );

        case RoutesManager.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );

        case RoutesManager.addProductScreen:
        return MaterialPageRoute(
          builder: (_) => const AddProductScreen(),
        );

        case RoutesManager.favoriteScreen:
          return MaterialPageRoute(
            builder: (_) => const FavouriteScreen(),
          );

          case RoutesManager.diseaseDetectionScreen:
            var args = settings.arguments as XFile;
          return MaterialPageRoute(
            builder: (_) => DiseaseDetection(image: args),
          );

          case RoutesManager.medicienDetailsScreen:
          return MaterialPageRoute(
            builder: (_) => const MedicienDetails(),
          );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
