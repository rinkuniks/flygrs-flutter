import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/HeaderBack.dart';

class RideCompletedView extends StatefulWidget {
  const RideCompletedView({super.key});

  @override
  State<RideCompletedView> createState() => _RideCompletedViewState();
}

class _RideCompletedViewState extends State<RideCompletedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Stack(
        children: [
          HeaderBack(whichBack: 'blueBack', isShare: true,),
          Positioned(
              top: 110,
              right: 0,
              left: 0,
              child: Container(
                // padding: const EdgeInsets.only(top: 40),
                margin: EdgeInsets.only(top: 46,left: 45, right: 45),
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.primaryBackgroundColor,
                    borderRadius: BorderRadius.circular(5)
                ),
                ),
              ),
        Positioned(
            top: 130,
          right: 0,
          left: 0,
            child: Container(
              margin: EdgeInsets.only(top: 46,left: 25, right: 25),
              height: MediaQuery.of(context).size.height-250,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryBackgroundColor,
                    width: 5,
                  )
              ),
            ),
        )
        ],
      )
      );
  }
}

