import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/res/components/AppGradientButton.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
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
              counterTimer: "2",
              image: "assets/images/chau_image.png",
              popularity: "",
              amount: "10")),
      const Center(
          child: Pages(
              titleTiming: "8:15pm",
              timeAway: "4 min away",
              counterTimer: "1",
              image: "assets/images/chau_image.png",
              popularity: "Most Popular",
              amount: "10")),
      const Center(
          child: Pages(
              titleTiming: "8:15pm",
              timeAway: "4 min away",
              counterTimer: "4",
              image: "assets/images/chau_image.png",
              popularity: "",
              amount: "10")),
    ];
  }

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
            //Map
             HeaderBack( whichBack: 'blueBack',),
            //Bottom Selection
            Column(
              children: [
                //Details to select
                Container(
                  height: 400,
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(56),
                        topRight: Radius.circular(56),
                      )),
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/images/bar.svg"),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        "Chauffeur Me",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            color: AppColors.white),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        height: 290,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 33),
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
                      right: 24, left: 24, top: 10, bottom: 40),
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
                      AppGradientButton(
                          height: 40,
                          title: 'Book Now',
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.onGoingScreen);
                          }
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        ]
      ),
    );
  }
}

class Pages extends StatefulWidget {
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
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Image.asset(widget.image),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //time section
                      Row(
                        children: [
                          Text(
                            widget.titleTiming,
                            style: const TextStyle(
                                color: AppColors.white, fontSize: 12),
                          ),
                          const Text(
                            " . ",
                            style:
                                TextStyle(color: AppColors.white, fontSize: 16),
                          ),
                          Text(
                            widget.timeAway,
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
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _itemCount++;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 2,
                                right: 2,top: 1,bottom: 1),
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
                            ),
                            Text(
                              _itemCount.toString(),
                              style: const TextStyle(
                                  color: AppColors.white, fontSize: 16),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _itemCount != 0 ? _itemCount-- : _itemCount++;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 2,
                                    right: 2,top: 1,bottom: 1),
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
                      Text(widget.popularity,
                          style: const TextStyle(
                              color: AppColors.white, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              '\$ ' + widget.amount,
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
          ]),
    );
  }
}
