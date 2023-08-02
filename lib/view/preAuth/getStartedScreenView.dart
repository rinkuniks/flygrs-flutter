import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: AppColors.primaryBackgroundColor,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Flygers.com",
                            style:
                                TextStyle(color: AppColors.white, fontSize: 12),
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: const Text(
                                  "Skip",
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.white),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.signupLogin);
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                child: Image.asset(
                                  'assets/images/skip.png',
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: ClipRRect(
                        child: Image.asset(
                          'assets/images/getStartedImage.png',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                color: AppColors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lorem Ipsum",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
