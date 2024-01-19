import 'package:final_project/core/widgets/land_screen.dart';
import 'package:final_project/features/market/ui/market_screen.dart';
import 'package:final_project/features/notification/ui/notification_screen.dart';
import 'package:final_project/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {

  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

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