import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flygrs/Utils/res/colors.dart';

import '../../Utils/res/Assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: AppColors.primaryBackgroundColor,
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        child:
                            Image.asset("assets/images/notification_icon.png")),
                    const Text(
                      "Hello , Amy !",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: AppColors.white),
                    ),
                    const Text(
                      "Where do you want to go?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: AppColors.white,
                child: Text("Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
