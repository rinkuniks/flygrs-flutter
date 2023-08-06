import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/NotificationHeader.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height / 2-120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(27), bottomLeft: Radius.circular(27)),
                  color: AppColors.primaryBackgroundColor,
                ),
              child: Column(
                children: [
                  NotificationHeader(),
                  Padding(
                    padding: const EdgeInsets.all(31.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/profile.png',
                                    height: 79,
                                    width: 79,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Amy',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white),
                                        ),
                                        SizedBox(height: 2,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/ratingStar.png',
                                              height: 19,
                                              width: 19,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(left: 3.0),
                                              child: Text(
                                                '4.5',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                    color: AppColors.white),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Image.asset(
                                'assets/images/next.png',
                                height: 19,
                                width: 19,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
