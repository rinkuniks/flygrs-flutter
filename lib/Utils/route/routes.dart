import 'package:flutter/material.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/view/account/account.dart';
import 'package:flygrs/view/account/editProfile.dart';
import 'package:flygrs/view/booking/booking_screen.dart';
import 'package:flygrs/view/booking/onGoing_screen.dart';
import 'package:flygrs/view/home/takeMe_Home.dart';
import 'package:flygrs/view/bottomNavigation/bottomNavigations.dart';
import 'package:flygrs/view/notification/notificationView.dart';
import 'package:flygrs/view/preAuth/getStartedScreenView.dart';
import 'package:flygrs/view/preAuth/signupLoginView.dart';
import 'package:flygrs/view/preAuth/splashView.dart';
import 'package:flygrs/view/rating/ratingView.dart';
import 'package:flygrs/view/rideCompleted/rideCompletedView.dart';

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

      case RouteName.bookingScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BookingScreen());

      case RouteName.rating:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RatingView());

<<<<<<< HEAD
      case RouteName.onGoingScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnGoingScreen());
=======
      case RouteName.rideCompleted:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RideCompletedView());
>>>>>>> 6b209fcb6a62dff13993501af4274810474d7d9b

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
