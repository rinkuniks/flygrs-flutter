import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Utils/res/colors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  List<Widget> _list(BuildContext context) {
    return [
      const Center(
          child: Pages(
              titleTiming: "8:15pm",
              timeAway: "4 min away",
              counterTimer: "0",
              image: "assets/images/chau_image.png",
              popularity: "Most Popular",
              amount: "10")),
      const Center(
          child: Pages(
              titleTiming: "8:15pm",
              timeAway: "4 min away",
              counterTimer: "0",
              image: "assets/images/chau_image.png",
              popularity: "Most Popular",
              amount: "10")),
      const Center(
          child: Pages(
              titleTiming: "8:15pm",
              timeAway: "4 min away",
              counterTimer: "0",
              image: "assets/images/chau_image.png",
              popularity: "Most Popular",
              amount: "10")),
      const Center(
          child: Pages(
              titleTiming: "8:15pm",
              timeAway: "4 min away",
              counterTimer: "0",
              image: "assets/images/chau_image.png",
              popularity: "Most Popular",
              amount: "10")),
    ];
  }

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
                  height: 320,
                  padding: const EdgeInsets.all(15),
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
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.vertical,
                          reverse: false,
                          physics: const BouncingScrollPhysics(),
                          itemCount: _list(context).length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (){
                                if (kDebugMode) {
                                  print("======$index");
                                }
                              },
                                child: _list(context).elementAt(index));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //Card Selection
                Container(
                  padding: const EdgeInsets.only(
                      right: 24, left: 24, top: 10, bottom: 10),
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

class Pages extends StatelessWidget {
  final titleTiming;
  final timeAway;
  final counterTimer;
  final image;
  final popularity;
  final amount;

  const Pages(
      {super.key,
      this.titleTiming,
      this.timeAway,
      this.counterTimer,
      this.image,
      this.popularity,
      this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Image.asset(image),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //time section
                      Row(
                        children: [
                          Text(
                            titleTiming,
                            style: const TextStyle(
                                color: AppColors.white, fontSize: 12),
                          ),
                          const Text(
                            " . ",
                            style:
                                TextStyle(color: AppColors.white, fontSize: 16),
                          ),
                          Text(
                            timeAway,
                            style: const TextStyle(
                                color: AppColors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      //Counter Section
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: const Text(
                                " + ",
                                style: TextStyle(
                                    color: AppColors.primaryBackgroundColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Text(
                              "0",
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 16),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: const Text(
                                " - ",
                                style: TextStyle(
                                    color: AppColors.primaryBackgroundColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Text(
                              "hrs",
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      //popularity
                      Text(popularity,
                          style: const TextStyle(
                              color: AppColors.white, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              '\$ ' + amount,
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
          ]),
    );
  }
}
