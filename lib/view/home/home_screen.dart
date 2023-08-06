import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flygrs/Utils/res/colors.dart';

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
        backgroundColor: AppColors.primaryBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          homeScreenComponent("Park My Car", "assets/images/car_park.svg"),
                          homeScreenTwoComponent("Take Me Home","assets/images/takeMeHome.svg"),
                          homeScreenTwoComponent("Chauffeur Me","assets/images/chauffeur.svg")
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget homeScreenComponent(String title, String image) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      margin: const EdgeInsets.only(left: 28, right: 28, top: 36),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: AppColors.secondaryBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(image)),
              SizedBox(
                width: 85,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBackgroundColor),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MaterialButton(
                  child: Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/btnBg.png"),
                            fit: BoxFit.cover),
                      ),
                      child: const Text("Hours",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: AppColors.white))),
                  onPressed: () {}),
              MaterialButton(
                  child: Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/btnGreyBg.png"),
                            fit: BoxFit.cover),
                      ),
                      child: const Text("Days",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              color: AppColors.primaryBackgroundColor))),
                  onPressed: () {})
            ],
          ),
        ],
      ),
    ),
  );
}

Widget homeScreenTwoComponent(String title, String image) {
  return Container(
    margin: const EdgeInsets.only(left: 28, right: 28, top: 28),
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(image)),
            SizedBox(
              width: 85,
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBackgroundColor),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MaterialButton(
                child: Container(
                    width: 120,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/btnBg.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Text("Book Now",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: AppColors.white))),
                onPressed: () {}),
          ],
        ),
      ],
    ),
  );
}
