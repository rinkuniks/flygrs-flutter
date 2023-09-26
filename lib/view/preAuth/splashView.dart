import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushNamed(context, RouteName.getStartedScreen);
    // });
    splashServices.checkAuthentication(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Center(
        child: Text("Flygrs",
          style: TextStyle(fontSize: 44, color: AppColors.white,
          fontFamily: "Poppins", fontWeight: FontWeight.w400),),
      ),
    );
  }
}
