import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/AppTextField.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
import 'package:flygrs/res/components/NotificationHeader.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<String> entries = <String>['Payment Method', 'History', 'Invite Friends', 'Settings', 'Logout'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height / 2 -100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(27), bottomRight:  Radius.circular(27)),
                  color: AppColors.primaryBackgroundColor,
                ),
                child: Column(
                  children: [
                   NotificationHeader(),
                    
                    Container(
                      margin: EdgeInsets.only(left: 32, right: 32, top: 31),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Activity',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: AppColors.white),
                          ),
                          Container(
                            height: 28,
                            width: 137,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBackgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(28))
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Jan-Feb 2023',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black),
                                ),
                                Image.asset(
                                  'assets/images/dropdown.png',
                                  height: 7,
                                  width: 14,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
          Positioned(
              top: 250,
              child: Container(
                height: MediaQuery.of(context).size.height-250,
                width: MediaQuery.of(context).size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),

                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 175,
                          margin: EdgeInsets.only(bottom: 55),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(27),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 1),
                            ]),
                        child:
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 33,
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
                                            child:  Text(
                                              'Noida Sector 15, E-19',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                  color: AppColors.black),
                                            ),),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Image.asset(
                                        'assets/images/locationLine.png',
                                        height: 20,
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
                                            child:  Text(
                                              'Anand Vihar Delhi, Phase 2',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                  color: AppColors.black),
                                            ),),
                                      ],
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25, bottom: 15),
                              child: Container(
                                height: 2,
                                width: MediaQuery.of(context).size.height-40,
                                color: AppColors.shinnySilver,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17, right: 17),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '25.00',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Completed',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black),
                                      ),
                                      SizedBox(width: 2,),
                                      Image.asset(
                                        'assets/images/arrow.png',
                                        height: 10,
                                        width: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                      );
                    }
                ),
              )
          )
        ],
      ),
    );
  }
}
