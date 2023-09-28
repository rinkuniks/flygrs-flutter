import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flygrs/Utils/constant.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/models/LoginResponse.dart';
import 'package:flygrs/view/bottomNavigation/bottomNavigations.dart';
import 'package:flygrs/view/preAuth/signupLoginView.dart';
import 'package:flygrs/view_model/signup_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/util.dart';
import '../respository/auth_repository.dart';
import 'login_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // for login
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) async {
      setLoading(false);
      print("-----${value.toString()}");
      if(value != null) {
        Utils.toastMessage(value['message'].toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', value['data']['token']);
        prefs.setString('name', value['data']['name']);
        Constant.TOKEN = value['data']['token'];
        Navigator.pushNamed(context, RouteName.bottomNavigation);
      }else{
        Utils.toastMessage(value['message'].toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print("-----E${error.toString()}");
      }
    });
  }

  // for sign up
  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.signUpApi(data).then((value) async {
      setLoading(false);
      // final userPreference =
      //     Provider.of<SignUpViewModel>(context, listen: false);
      // userPreference.saveUser(Data(
      //   token: value['token'].toString(),
      // ));
      // userPreference.saveUser(Data(
      //   token: value['name'].toString(),
      // ));
      // Utils.toastMessage('signUp Successfully');
      // Navigator.pushNamed(context, RouteName.bottomNavigation);
      if(value != null) {
        Utils.toastMessage(value['message'].toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', value['data']['token']);
        prefs.setString('name', value['data']['name']);
        Constant.TOKEN = value['data']['token'];
        Navigator.pushNamed(context, RouteName.bottomNavigation);
      }else{
        Utils.toastMessage(value['message'].toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarError(error.toString(), context);
    });
  }

  // for logout
  Future<void> logOutApi(BuildContext context) async {
    setLoading(true);
    _myRepo.logoutApi().then((value) async {
      setLoading(false);
      print("-----${value.toString()}");
      if(value != null) {
        Utils.removeValues();
        Utils.toastMessage(value['message'].toString());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupLoginView()),);
      }else{
        Utils.toastMessage(value['message'].toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print("-----E${error.toString()}");
      }
    });
  }
}



