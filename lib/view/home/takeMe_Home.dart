
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/res/components/AppGradientButton.dart';
import 'package:flygrs/res/components/AppTextField.dart';
import 'package:flygrs/res/components/NotificationHeader.dart';

class TakeMeHomeView extends StatefulWidget {
  const TakeMeHomeView({super.key});

  @override
  State<TakeMeHomeView> createState() => _TakeMeHomeViewState();
}

class _TakeMeHomeViewState extends State<TakeMeHomeView> {
  final PageController _pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  int _activePage = 0;

  List<Widget> _list(BuildContext context) {
    return [
      const Center(
          child: Pages(
        title: "You Have Multiple Promos",
        subTitle: "Terms Apply *",
        image: "assets/images/takeMeHomeBg.png",
      )),
      const Center(
          child: Pages(
        title: "You Have New Multiple Promos",
        subTitle: "Terms Apply *",
        image: "assets/images/takeMeHomeBg.png",
      )),
      const Center(
          child: Pages(
        title: "You Have Next Multiple Promos",
        subTitle: "Terms Apply *",
        image: "assets/images/takeMeHomeBg.png",
      )),
      const Center(
          child: Pages(
            title: "You Have Next Multiple Promos",
            subTitle: "Terms Apply *",
            image: "assets/images/takeMeHomeBg.png",
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 40),
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBackgroundColor,
                    ),
                    child: const Column(
                      children: [
                        NotificationHeader(isBack: true),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 56, left: 28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Take Me Home',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                  ),
                                  Text(
                                    'Enter Location',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: Container(
                    height: 272,
                    width: MediaQuery.of(context).size.width - 40,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 5),
                        ]),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 39,
                            left: 25,
                            right: 25,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/location.png',
                                      height: 23,
                                      width: 23,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: AppTextField(
                                      hintText: "",
                                      isPassword: false,
                                    )),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Image.asset(
                                    'assets/images/locationLine.png',
                                    height: 40,
                                    width: 1,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/location.png',
                                      height: 23,
                                      width: 23,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: AppTextField(
                                      hintText: "",
                                      isPassword: false,
                                    )),
                                  ],
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AppGradientButton(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.bookingScreen);
                          },
                          height: 51,
                          title: "Search",
                          bottomLeftCorner: 20,
                          bottomRightCorner: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    height: 120,
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.shadowsGrey,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 5),
                        ]),
                    child: Column(
                      children: [
                        // Image Scrollable UI
                        Expanded(
                          flex: 4,
                          child: PageView.builder(
                            controller: _pageController,
                            allowImplicitScrolling: true,
                            //  children: _list,
                            scrollDirection: Axis.horizontal,
                            reverse: false,
                            physics: const BouncingScrollPhysics(),
                            // controller: controller,
                            onPageChanged: (int pages) {
                              setState(() {
                                _activePage = pages;
                              });
                            },
                            itemCount: _list(context).length,
                            itemBuilder: (BuildContext context, int index) {
                              return _list(context).elementAt(index);
                            },
                          ),
                        ),
                        // Triple Dot UI
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(
                                  _list(context).length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: InkWell(
                                          onTap: () {
                                            _pageController.animateToPage(index,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeIn);
                                          },
                                          child: CircleAvatar(
                                            radius: 5,
                                            backgroundColor:
                                                _activePage == index
                                                    ? AppColors.activeDot
                                                    : AppColors.deActiveDot,
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final title;
  final subTitle;
  final image;

  const Pages({super.key, this.title, this.subTitle, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              alignment: Alignment.centerRight),
        ),
      padding: const EdgeInsets.only(left: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
