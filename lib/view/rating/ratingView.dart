import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/res/components/AppGradientButton.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
class RatingView extends StatefulWidget {
  const RatingView({super.key});

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2 -100,
                decoration: BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(27), bottomLeft: Radius.circular(27)),
                ),
                child: Column(
                  children: [
                    HeaderBack(whichBack: 'whiteBack',),
                    Text("Rating",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.white)
                    ),
                  ],
                ),
              )
          ),
          Positioned(
              top: 200,
              child: Container(
                height: MediaQuery.of(context).size.height-300,
                width: MediaQuery.of(context).size.width - 80,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: AppColors.secondaryBackgroundColor,
                    borderRadius: BorderRadius.circular(34),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5),
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text("Lorem ipsum",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              color: AppColors.primaryBackgroundColor)
                      ),
                    ),
                    Text("Lorem ipsum",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: AppColors.black)
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 17),
                      height: 2,
                      width: 97,
                      color: AppColors.white,
                    ),
                    SizedBox(height: 12,),
                    Text("How was your trip?",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.primaryBackgroundColor)
                    ),
                    Container(
                      width: 217,
                      height: 48,
                      child: Text("Your feedback will help us improve experience",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: AppColors.black)
                      ),
                    ),
                    SizedBox(height: 11,),
                    RatingBar(
                      initialRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                      full: Image.asset(
                          'assets/images/filledStar.png',
                      height: 42,
                      width: 42,
                      ),
                      half: Image.asset(
                       'assets/images/filledStar.png',
                      height: 42,
                      width: 42,
                      ),
                      empty: Image.asset(
                       'assets/images/emptyStar.png',
                       height: 42,
                       width: 42,
                      ),
                   ),
                 itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    print(rating);
                   },
                   ),
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 30.0, right: 30.0),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(19)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 23, left: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Additional comments...",
                            border: InputBorder.none,
                          ),
                          maxLines: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Positioned(
             top: 165,
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Image.asset(
            'assets/images/profile.png',
                height: 79,
                width: 79,
               ),
              ),
          ),
          Positioned(
            top: 725,
            child: Container(
              width: MediaQuery.of(context).size.width - 140,
              margin: const EdgeInsets.symmetric(horizontal: 70),
              child: AppGradientButton(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.rideCompleted);
                },
                height: 50,
                width: 100,
                title: "Submit Review",

              ),
            ),
          )
        ],
      ),
    );
  }
}
