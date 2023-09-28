import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flygrs/models/LoginResponse.dart';
import '../../Utils/route/routeName.dart';
import '../login_view_model.dart';

class SplashServices {
  Future<Data> getUserdata() => LoginViewModel().getUser();
  void checkAuthentication(context) async {
    getUserdata().then((value) async {
      print(value.token);
      if (value.token == null || value.token.toString() == '') {
        print(">>>>>>>>>>>>>>>>");
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.getStartedScreen);
        // Navigator.pushNamed(context, RouteName.login);
      } else {
        print("????????????????");
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.bottomNavigation);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
