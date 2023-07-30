import 'package:flutter/material.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/view/preAuth/getStartedScreenView.dart';
import 'package:flygrs/view/preAuth/signupView.dart';
import 'package:flygrs/view/preAuth/splashView.dart';

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
      case RouteName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupView());

      //Default Route
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text('No Route found...'),
                  ),
                ));
    }
  }
}
