import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/AppGradientButton.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
class RatingView extends StatefulWidget {
  const RatingView({super.key});

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2 -100,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(27), bottomLeft: Radius.circular(27)),
                ),
                child: Column(
                  children: [
                    HeaderBack(whichBack: 'whiteBack',)
                  ],
                ),
              )
          ),
          Positioned(
              top: 200,
              child: Container(
                height: MediaQuery.of(context).size.height-300,
                width: MediaQuery.of(context).size.width - 80,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: AppColors.secondaryBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5),
                    ]),
              )
          ),
          Positioned(
             top: 160,
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Image.asset(
            'assets/images/profile.png',
                height: 79,
                width: 79,
               ),
              ),
          ),
          Positioned(
            top: 500,
            child: Container(
              width: 200,
              child: AppGradientButton(
                height: 50,
                width: 100,
                title: "Submit Review",

              )
            ),
          )
        ],
      ),
    );
  }
}
