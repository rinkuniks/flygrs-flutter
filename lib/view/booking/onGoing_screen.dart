import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flygrs/Utils/res/colors.dart';

class OnGoingScreen extends StatefulWidget {
  const OnGoingScreen({super.key});

  @override
  State<OnGoingScreen> createState() => _OnGoingScreenState();
}

class _OnGoingScreenState extends State<OnGoingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/mapTwo.png")),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //backButton
              Container(
                  margin: const EdgeInsets.all(24),
                  height: 20,
                  width: 20,
                  child: Image.asset("assets/images/blueBack.png")),
              Container(
                margin: const EdgeInsets.all(24),
                height: 250,
                padding: const EdgeInsets.all(18),
                decoration: const BoxDecoration(
                    color: AppColors.secondaryBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                            SvgPicture.asset("assets/images/saftey.svg"),
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
                    const Divider(
                      thickness: 1,
                      color: AppColors.white,
                    ),
                    //Area details
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
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}