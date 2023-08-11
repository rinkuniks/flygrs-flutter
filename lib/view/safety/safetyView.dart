import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
class SafetyView extends StatefulWidget {
  const SafetyView({super.key});

  @override
  State<SafetyView> createState() => _SafetyViewState();
}

class _SafetyViewState extends State<SafetyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
          Container(
             decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/mapOne.png"),
                  fit: BoxFit.cover,
                )
              ),
           ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderBack(whichBack: 'blueBack',),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 460,
                  decoration:  BoxDecoration(
                      color: AppColors.primaryBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(27)),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5
                        )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 29, left: 34, right: 34),
                        child: Text(
                          "Safety Toolkit",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              color: AppColors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 21, right: 16),
                        child: const Divider(
                          thickness: 1,
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20,left: 34, right: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/safety_center.svg"),
                                SizedBox(width: 22,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Safety Centre",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          color: AppColors.white),
                                    ),
                                    SizedBox(height: 4,),
                                    SizedBox(
                                      width: 196,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            color: AppColors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: Image.asset(
                                'assets/images/next.png',
                                height: 14,
                                width: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 21, right: 16),
                        child: const Divider(
                          thickness: 1,
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20,left: 34, right: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/safety_center.svg"),
                                SizedBox(width: 22,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Share My trip",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          color: AppColors.white),
                                    ),
                                    SizedBox(height: 4,),
                                    SizedBox(
                                      width: 196,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            color: AppColors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: Image.asset(
                                'assets/images/next.png',
                                height: 14,
                                width: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 21, right: 16),
                        child: const Divider(
                          thickness: 1,
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20,left: 34, right: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/safety_center.svg"),
                                SizedBox(width: 22,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "911 Assistance",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          color: AppColors.white),
                                    ),
                                    SizedBox(height: 4,),
                                    SizedBox(
                                      width: 196,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            color: AppColors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: Image.asset(
                                'assets/images/next.png',
                                height: 14,
                                width: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}
