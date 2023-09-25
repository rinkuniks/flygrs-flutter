import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/models/LoginResponse.dart';
import 'package:provider/provider.dart';
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
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<LoginViewModel>(context, listen: false);
      userPreference.saveUser(Data(
        token: value['token'].toString(),
      ));
      Utils.toastMessage('Login Successful');
      Navigator.pushNamed(context, RouteName.bottomNavigation);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // /// for sign up
  // Future<void> signUpApi(dynamic data, BuildContext context) async {
  //   setLoading(true);
  //   _myRepo.signUpApi(data).then((value) {
  //     setLoading(false);
  //     Utils.flushBarError('signUp Succesfuly', context);
  //     Navigator.pushNamed(context, RouteName.home);
  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     Utils.flushBarError(error.toString(), context);
  //   });
  // }
}
