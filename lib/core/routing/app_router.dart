import 'package:final_project/core/di/dependency_injection.dart';
import 'package:final_project/core/models/chat_model.dart';
import 'package:final_project/core/models/the_data_to_profile_as_visitor.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/widgets/land_screen.dart';
import 'package:final_project/features/chat/ui/chat_body_screen.dart';
import 'package:final_project/features/chat/ui/chats_screen.dart';
import 'package:final_project/features/community/logic/manager/community_cubit.dart';
import 'package:final_project/features/market/data/models/product/product_data.dart';
import 'package:final_project/features/market/logic/product_cubit/product_cubit.dart';
import 'package:final_project/features/market/ui/add_product_screen.dart';
import 'package:final_project/features/market/ui/cart_screen.dart';
import 'package:final_project/features/market/ui/favourite_screen.dart';
import 'package:final_project/features/market/ui/item_details_screen.dart';
import 'package:final_project/features/market/ui/market_screen.dart';
import 'package:final_project/features/market/ui/search/search_screen.dart';
import 'package:final_project/features/notification/ui/notification_and_appointment_screen.dart';
import 'package:final_project/features/on_bourding/ui/base_screen.dart';
import 'package:final_project/features/profile/ui/edit_profile.dart';
import 'package:final_project/features/profile/ui/profile_screen.dart';
import 'package:final_project/features/registration/logic/log_in_cubit/log_in_cubit.dart';
import 'package:final_project/features/registration/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:final_project/features/registration/ui/log_in/log_in_screen.dart';
import 'package:final_project/features/registration/ui/phone_auth/phone_auth_screen.dart';
import 'package:final_project/features/registration/ui/sign_in/sign_in_screen.dart';
import 'package:final_project/features/scan/data/models/diseases_info.dart';
import 'package:final_project/features/scan/ui/booking_appointment.dart';
import 'package:final_project/features/scan/ui/disease_detection_screen.dart';
import 'package:final_project/features/scan/ui/medicien_details.dart';
import 'package:final_project/features/scan/ui/widgets/appointment/confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(
      //     builder: (_) => const MarketScreen(),
      //   );

      case RoutesManager.landScreen:
        if(CachHelper.getId().isNotEmpty || CachHelper.getToken().isNotEmpty){
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (BuildContext context) => getIt<CommunityCubit>(),
                ),
                BlocProvider(
                  create: (BuildContext context) => getIt<ProductCubit>(),
                ),
              ],
                child: const LandScreen(),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const OnBourdingScreen(),
        );

      case RoutesManager.marketScreen:
        return MaterialPageRoute(
          builder: (_) => const MarketScreen(),
        );

      case RoutesManager.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationAndAppointmentScreen(),
        );

      case RoutesManager.profileScreen:
        DataToProfileAsVisitor args = settings.arguments as DataToProfileAsVisitor;
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(
            dataToProfileAsVisitor: args,
          ),
        );

      case RoutesManager.itemDetailScreen:
        //
        var args = settings.arguments as ProductData;
        return MaterialPageRoute(
          builder: (_) => ItemDetailsScreen(product: args,),
        );

      case RoutesManager.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );

        case RoutesManager.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
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
        var args = settings.arguments as DiseaseInfoModel;
        return MaterialPageRoute(
          builder: (_) => DiseaseDetection(diseaseInfoModel: args),
        );

      case RoutesManager.medicienDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const MedicienDetails(),
        );

      case RoutesManager.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
          create:(context)=> getIt<SignInCubit>(),
          child: const SignInScreen()
          ),
        );

      case RoutesManager.logInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create:(context)=> getIt<LogInCubit>(),
            child: const LogInScreen(),
          ),
        );

      case RoutesManager.bookingScreen:
        return MaterialPageRoute(
          builder: (_) => const BookingAppointmentScreen(),
        );

      case RoutesManager.confirmScreen:
        return MaterialPageRoute(
          builder: (_) => const ConfirmScreen(),
        );

      case RoutesManager.chatScreen:
        return MaterialPageRoute(
          builder: (_) => const ProviderScope(child: ChatScreen()),
        );

        case RoutesManager.chatBodyScreen:
          var arg = settings.arguments as ChatBodyModel;
        return MaterialPageRoute(
          builder: (_) => ProviderScope(
            child: ChatBodyScreen(
              chatModel: arg,
            ),
          ),
        );

        case RoutesManager.phoneAuthScreen:
          var arg = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PhoneAuthScreen(phone: arg),
        );

        case RoutesManager.editProfileScreen:
          //var arg = settings.arguments as PhoneAuthModel;
        return MaterialPageRoute(
          builder: (_) => const EditProfile(),
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
