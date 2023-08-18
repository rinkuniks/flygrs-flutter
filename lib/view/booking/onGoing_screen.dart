import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/res/components/AppGradientButton.dart';
import 'package:flygrs/res/components/HeaderBack.dart';

class OnGoingScreen extends StatefulWidget {
  const OnGoingScreen({super.key});

  @override
  State<OnGoingScreen> createState() => _OnGoingScreenState();
}

class _OnGoingScreenState extends State<OnGoingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
    children: [
      SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/images/mapOne.png")),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //backButton
          HeaderBack(whichBack: 'blueBack'),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
            height: 350,
            padding: const EdgeInsets.all(18),
            decoration:  BoxDecoration(
                color: AppColors.secondaryBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5
                  )
                ]
            ),
            child: Column(
              children: [
                //NameDetails
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/photo_icon.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Gregory Smith"),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/star.svg"),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("4.9"),
                                const SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset("assets/images/info.svg"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/msg_icon.svg"),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset("assets/images/call_icon.svg"),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: SvgPicture.asset("assets/images/saftey.svg"),
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.safetyScreen);
                          },
                        )
                      ],
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.white,
                ),
                //Location details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/blue_location.svg"),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Text("Pick-up location"),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 6),
                        child: SvgPicture.asset(
                            "assets/images/blue_line.svg")),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/blue_location.svg"),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Text("Drop-off location"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                const Divider(
                  thickness: 1,
                  color: AppColors.white,
                ),
                //Area details
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/images/icon_image.svg"),
                    const Column(
                      children: [
                        Text("Distance"),
                        Text("0.2 KM"),
                      ],
                    ),
                    const Column(
                      children: [
                        Text("Time"),
                        Text("2 mins"),
                      ],
                    ),
                    const Column(
                      children: [
                        Text("Price"),
                        Text("\$ 25.00"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 23,),
                AppGradientButton(
                    topLeftCorner: 4,
                    topRightCorner: 4,
                    bottomRightCorner: 4,
                    bottomLeftCorner: 4,
                    height: 40,
                    title: 'Book Now',
                    onTap: () {
                      _dialogBuilder(context);
                    }
                ),
              ],
            ),
          )
        ],
      )
    ],
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.primaryBackgroundColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          title: SvgPicture.asset("assets/images/tick.svg"),
          content: const SizedBox(
            height: 70,
            child: Column(
              children: [
                Text('Booking Successful',
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
                SizedBox(height: 10,),
                Text('Your booking has been confirmed.',
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
                Text('Driver will arrive in 2 Minutes.',
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                const Divider(
                  thickness: 1,
                  color: AppColors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                    Image.asset("assets/images/line.png"),
                    InkWell(
                      onTap: () {
                         Navigator.pop(context);
                         Future.delayed(const Duration(milliseconds: 100), () {
                           Navigator.pushNamed(context, RouteName.rideCompleted);
                         });
                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
