import 'package:flutter/material.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/view/account/account.dart';
import 'package:flygrs/view/account/editProfile.dart';
import 'package:flygrs/view/home/takeMe_Home.dart';
import 'package:flygrs/view/bottomNavigation/bottomNavigations.dart';
import 'package:flygrs/view/notification/notificationView.dart';
import 'package:flygrs/view/preAuth/getStartedScreenView.dart';
import 'package:flygrs/view/preAuth/signupLoginView.dart';
import 'package:flygrs/view/preAuth/splashView.dart';
import 'package:flygrs/view/rating/ratingView.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //PreAuth
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RouteName.getStartedScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const GetStartedScreen());

      //Auth
      // case RoutesName.login:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const LoginView());

      case RouteName.signupLogin:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupLoginView());

      case RouteName.takeMeHome:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TakeMeHomeView());

      case RouteName.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AccountScreen());

      case RouteName.editProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EditProfileView());

      case RouteName.bottomNavigation:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BottomNavigation());

      case RouteName.notification:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NotificationView());

      case RouteName.rating:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RatingView());

    //Default Route
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text('No Route found...'),
                  ),
                )
        );
    }
  }
}
