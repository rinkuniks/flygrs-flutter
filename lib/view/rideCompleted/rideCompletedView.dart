import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/res/components/AppGradientButton.dart';
import 'package:flygrs/res/components/HeaderBack.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
// import 'package:documents_picker/documents_picker.dart';


class RideCompletedView extends StatefulWidget {
  const RideCompletedView({super.key});

  @override
  State<RideCompletedView> createState() => _RideCompletedViewState();
}

class _RideCompletedViewState extends State<RideCompletedView> {

  Future<void> shareFile() async {
    // List<dynamic> docs = await DocumentsPicker.pickDocuments;
    // if (docs == null || docs.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: "Share File",//docs[0] as String,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushNamed(context, RouteName.rating);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Stack(
        children: [
          HeaderBack(
            whichBack: 'blueBack',
            isShare: true,
            onTap: () {
              shareFile();
            },
          ),
          Positioned(
            top: 110,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(top: 46,left: 25, right: 25),
              height: MediaQuery.of(context).size.height-200,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.primaryBackgroundColor,
                    width: 5,
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:  EdgeInsets.only(top: 60, left: 39, right: 39),
                    width: 266,
                    height: 48,
                    child: Text('Make sure your belongings are not left behind.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 23, left: 39, right: 39),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.shinnySilver,
                        width: 1,
                      )
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.only(top: 23, left: 39, right: 39),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/profile.png',
                          height: 49,
                          width: 49,
                        ),
                        SizedBox(width: 13,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Gregory Smith',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black
                                  ),
                                ),
                                SizedBox(width: 13,),
                                Text('25.0',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black
                                  ),),
                              ],
                            ),
                            Text('3 hrs',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 23, left: 39, right: 39),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.shinnySilver,
                          width: 1,
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 23, left: 39, right: 39),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pick Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black
                          ),
                        ),
                        Text('Lorem ipsum dolor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 23, left: 39, right: 39),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Drop Off',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black
                          ),
                        ),
                        Text('Lorem ipsum dolor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 23, left: 39, right: 39),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.shinnySilver,
                          width: 1,
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 19, left: 39, right: 39),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Payment Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black
                          ),
                        ),
                        SizedBox(height: 13,),
                        Text('Card',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                        SizedBox(height: 4,),
                        Text('Discount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 23, left: 39, right: 39),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.shinnySilver,
                          width: 1,
                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 19, left: 39, right: 39),
                    child: Text('Paid Amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 37, left: 39, right: 39),
                    child: Column(
                      children: [
                        AppGradientButton(
                            topLeftCorner: 4,
                            topRightCorner: 4,
                            bottomRightCorner: 4,
                            bottomLeftCorner: 4,
                            height: 50,
                            title: 'Back to home',
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamedAndRemoveUntil(RouteName.bottomNavigation, (route) => false);                            }
                        ),
                        SizedBox(height: 12,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width-78,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: AppColors.shinnySilver,
                          ),
                          child: GestureDetector(
                            child: Center(
                              child: Text("Download Bill",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                )
                                ,),
                            ),
                            onTap: () {

                            },
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 90,
            right: 0,
            left: 0,
            child: Container(
              // padding: const EdgeInsets.only(top: 40),
              margin: EdgeInsets.only(top: 46,left: 45, right: 45),
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You Have Arrived',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}

