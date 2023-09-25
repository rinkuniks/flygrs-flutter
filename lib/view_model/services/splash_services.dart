// // ignore_for_file: use_build_context_synchronously
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flygrs/models/LoginResponse.dart';
// import '../../Utils/route/routeName.dart';
// import '../../model/user_model.dart';
// import '../../utils/routes/routes_name.dart';
// import '../login_view_model.dart';
//
// /// Created by Sawan Kumar on 12/05/23.
//
// class SplashServices {
//   Future<LoginResponse> getUserdata() => LoginViewModel().getuser();
//   void checkAuthentication(context) async {
//     getUserdata().then((value) async {
//       print(value.token);
//       if (value.token.toString() == null || value.token.toString() == '') {
//         await Future.delayed(const Duration(seconds: 3));
//         print("1111-----------------------------");
//         Navigator.pushNamed(context, RouteName.login);
//          //       Navigator.pushNamed(context, RoutesName.home);
//
//       } else {
//         await Future.delayed(const Duration(seconds: 3));
//  print("1111-----------------------------2222");
// //  Navigator.pushNamed(context, RoutesName.home);
//         Navigator.pushNamed(context, RouteName.login);
//       }
//     }).onError((error, stackTrace) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
// }
