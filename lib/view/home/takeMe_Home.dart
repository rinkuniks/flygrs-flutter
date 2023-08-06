import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/AppGradientButton.dart';
import 'package:flygrs/res/components/AppTextField.dart';
import 'package:flygrs/res/components/NotificationHeader.dart';

class TakeMeHomeView extends StatefulWidget {
  const TakeMeHomeView({super.key});

  @override
  State<TakeMeHomeView> createState() => _TakeMeHomeViewState();
}

class _TakeMeHomeViewState extends State<TakeMeHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: AppColors.primaryBackgroundColor,
              ),
              child: Column(
                children: [
                  NotificationHeader(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 56, left: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Take Me Home',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                            ),
                            Text(
                              'Enter Location',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 250,
            child: Container(
              height: 271,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5),
                  ]),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 39, left: 25, right: 25, ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/location.png',
                                height: 23,
                                width: 23,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: AppTextField(
                                hintText: "",
                                isPassword: false,
                              )),
                            ],
                          ),
                          Image.asset(
                            'assets/images/locationLine.png',
                            height: 40,
                            width: 1,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/location.png',
                                height: 23,
                                width: 23,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: AppTextField(
                                hintText: "",
                                isPassword: false,
                              )),
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AppGradientButton(
                    height: 50,
                    title: "Search",

                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
