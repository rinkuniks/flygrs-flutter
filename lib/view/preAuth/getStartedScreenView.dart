import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  int _activePage = 0;

  List<Widget> _list(BuildContext context) {
    return [
      const Center(
          child: Pages(
        title: "Captain America",
        subTitle:
            "This is the first page which you are looking above with the image.",
        imgPath: "assets/images/getStartedImage.png",
      )),
      const Center(
          child: Pages(
        title: "Ironman",
        subTitle:
            "This is the Second page which you are looking above with the image.",
        imgPath: "assets/images/slider2.png",
      )),
      const Center(
          child: Pages(
        title: "Thor",
        subTitle:
            "This is the Third page which you are looking above with the image.",
        imgPath: "assets/images/slider3.png",
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            // carousel UI
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  // Skip Btn UI
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 40),
                      color: AppColors.primaryBackgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Flygers.com",
                            style:
                                TextStyle(color: AppColors.white, fontSize: 12),
                          ),
                          (_activePage == 0) ? InkWell(
                            onTap: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setString('isIntroDone', '1');
                              Navigator.pushNamed(context, RouteName.signupLogin);
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "Skip",
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                ClipRRect(
                                  child: Image.asset(
                                    'assets/images/skip.png',
                                    height: 15,
                                    width: 15,
                                  ),
                                ),
                              ],
                            ),
                          ) : Container(width: 70,)
                        ],
                      ),
                    ),
                  ),
                  // Image Scrollable UI
                  Expanded(
                    flex: 9,
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
                ],
              ),
            ),
            // Triple Dot UI
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.white,
                padding: const EdgeInsets.only(left: 24, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.generate(
                      _list(context).length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: _activePage == index
                                    ? AppColors.activeDot
                                    : AppColors.deActiveDot,
                              ),
                            ),
                          )),
                ),
              ),
            ),
            // Button UI
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.white,
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      child: (_activePage == 2)
                          ? Container(
                              width: 120,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/btnBg.png"),
                                    fit: BoxFit.cover),
                              ),
                              child: const Text("Get Started",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      color: AppColors.white)))
                          : Container(
                              width: 120,
                              height: 40,
                            ),
                      onTap: () async {
                          // Utils.snackBar("Clicked", context);
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString('isIntroDone', '1');
                          Navigator.pushNamed(context, RouteName.signupLogin);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final title;
  final subTitle;
  final imgPath;

  const Pages({super.key, this.title, this.subTitle, this.imgPath});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(children: <Widget>[
      Container(
        width: screenWidth * 1,
        height: screenHeight * 0.55,
        padding: const EdgeInsets.only(left: 24),
        color: AppColors.primaryBackgroundColor,
        child: Image.asset(
          imgPath,
        ),
      ),
      Expanded(
        child: Container(
          alignment: Alignment.center,
          color: AppColors.white,
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subTitle,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 16, color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
