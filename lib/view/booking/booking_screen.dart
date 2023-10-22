import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/Utils/util.dart';
import 'package:flygrs/res/components/AppGradientButton.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
import 'package:flygrs/view_model/chauffeurMe_view_model.dart';
import 'package:provider/provider.dart';
import '../../Utils/res/colors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  ChauffeurMeViewModel chauffeurViewModel = ChauffeurMeViewModel();
  int? driverId;
  int hours = 1;
  int? prices;

  @override
  void initState() {
    super.initState();
    chauffeurViewModel.fetchChauffeurListApi();
  }
  getDriverDataOnSelect(int hour, int price) {
    hours = hour;
    prices = price;
  }
  bookingSuccessCallback(String msg) {
    if(msg == 'Success') {
      setState(() {
        _dialogBuilder(context);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/mapOne.png")),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Map
            HeaderBack(
              whichBack: 'blueBack',
            ),
            //Bottom Selection
            Column(
              children: [
                //Details to select
                Container(
                  height: 400,
                  padding: const EdgeInsets.only(top: 15),
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
                          child: ChangeNotifierProvider<ChauffeurMeViewModel>(
                              create: (BuildContext context) =>
                                  chauffeurViewModel,
                              child: Consumer<ChauffeurMeViewModel>(
                                  builder: (context, value, _) {
                                return ListView.builder(
                                  padding: EdgeInsets.only(top: 33),
                                  controller: _pageController,
                                  scrollDirection: Axis.vertical,
                                  reverse: false,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: value.chauffeurListData.data?.data?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            driverId = value.chauffeurListData.data?.data?[index].id;
                                            prices = value.chauffeurListData.data?.data?[index].userDetail?.price;
                                            for (var item in (value.chauffeurListData.data!.data)!) {
                                              if (item.id == value.chauffeurListData.data?.data?[index].id) {
                                                value.chauffeurListData.data?.data?[index].userDetail?.isSelected = true;
                                              } else {
                                                value.chauffeurListData.data?.data?[index].userDetail?.isSelected = false;
                                              }
                                            }
                                          });
                                        },
                                        child: Center(
                                            child: Pages(
                                                titleTiming: "",
                                                timeAway: "",
                                                counterTimer: "0",
                                                image:
                                                    "assets/images/chau_image.png",
                                                popularity: "Most Popular",
                                                amount: "${value.chauffeurListData.data?.data?[index].userDetail?.price}",
                                                isSelected: value.chauffeurListData.data?.data?[index].userDetail?.isSelected,
                                                onTap: getDriverDataOnSelect,
                                            )));
                                  },
                                );
                              }))),
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
                          topLeftCorner: 4,
                          topRightCorner: 4,
                          bottomRightCorner: 4,
                          bottomLeftCorner: 4,
                          height: 40,
                          title: 'Book Now',
                          onTap: () {
                            if(((driverId ?? 0) > 0) &&
                                (hours  > 0) && ((prices ?? 0) > 0)) {
                              Map<String, String> data = {
                                "driver_id": driverId.toString(),
                                "price": prices.toString(),
                                "duration": hours.toString(),
                                "duration_type": 'hour'
                              };
                              chauffeurViewModel.submitBookingApi(data, context, bookingSuccessCallback);
                            } else {
                              print("DRIVErID--${driverId}");
                              print("price--${prices}");
                              print("duration--${hours}");
                              Utils.toastMessage('Please Select a driver');
                            }
                          }),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
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
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Image.asset("assets/images/line.png"),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 100), () {
                          Navigator.pushNamed(context, RouteName.onGoingScreen);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Done",
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
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

class Pages extends StatefulWidget {
  final titleTiming;
  final timeAway;
  final counterTimer;
  final image;
  final popularity;
  final amount;
  final isSelected;
  final Function? onTap;

  const Pages(
      {super.key,
      this.titleTiming,
      this.timeAway,
      this.counterTimer,
      this.image,
      this.popularity,
      this.amount,
      this.isSelected,
        this.onTap
      });

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
      margin: const EdgeInsets.only(bottom: 10, left: 32, right: 32),
      decoration: widget.isSelected
          ? BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)))
          : null,
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
                              onTap: () {
                                setState(() {
                                  _itemCount++;
                                  widget.onTap!(_itemCount, int.parse(widget.amount));
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 2, right: 2, top: 1, bottom: 1),
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
                              onTap: () {
                                setState(() {
                                  print('>>>>>>>>>>${int.parse(widget.amount)}');
                                  _itemCount != 0 ? _itemCount-- : _itemCount++;
                                  widget.onTap!(_itemCount, int.parse(widget.amount));

                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 2, right: 2, top: 1, bottom: 1),
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
              '\$ ' + '${(int.parse(widget.amount))*_itemCount}',
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
          ]),
    );
  }
}
