import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Utils/res/colors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Map
            Container(
              alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.all(24),
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/images/blueBack.png"))
                ],
              ),
            ),
            //Bottom Selection
            Column(
              children: [
                //Details to select
                Container(
                  padding: const EdgeInsets.all(24),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/images/bar.svg"),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Chauffeur Me",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: AppColors.white),
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.white,
                      ),
                      SvgPicture.asset("assets/images/list_driver.svg"),
                      const SizedBox(
                        height: 10,
                      ),
                      SvgPicture.asset("assets/images/list_driver.svg"),
                      const SizedBox(
                        height: 10,
                      ),
                      SvgPicture.asset("assets/images/list_driver.svg"),
                    ],
                  ),
                ),
                //Card Selection
                Container(
                  padding: const EdgeInsets.only(right: 24,left: 24,top: 10,bottom: 10),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/card_icon.png"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Card"),
                            ],
                          ),
                          SvgPicture.asset("assets/images/card_next.svg")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/btnBg.png"),
                                fit: BoxFit.cover),
                          ),
                          child: const Text("Get Started",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  color: AppColors.white))),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
