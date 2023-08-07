import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
import 'package:flygrs/res/components/ProfileShadowView.dart';
class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Column(
        children: [
         HeaderBack(whichBack: 'blueBack',),
          Padding(
            padding: const EdgeInsets.only(top: 11.0, left: 29, right: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Profile',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBackgroundColor),
                ),
                Image.asset(
                  'assets/images/profile.png',
                  height: 79,
                  width: 79,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 81, left: 28, right: 28),
            height: MediaQuery.of(context).size.height-300,
            // color: Colors.red,
            child: Column(
              children: [
                ProfileShadowView(title1: 'Name', title2: 'Ame',),
                SizedBox(height: 9,),
                ProfileShadowView(title1: 'E-mail Address', title2: 'xyz@gmail.com',),
                SizedBox(height: 9,),
                ProfileShadowView(title1: 'Mobile Number', title2: '0000 00 0000',),
                SizedBox(height: 9,),
                ProfileShadowView(title1: 'Gender', title2: 'Female',),
                SizedBox(height: 9,),
                ProfileShadowView(title1: 'Birthday', title2: 'DD/MM/YYYY',),
                SizedBox(height: 9,),
                ProfileShadowView(title1: 'Change Password', title2: 'xxxxxxx',),
                // Container(
                //   height: 58,
                //   decoration: BoxDecoration(
                //       color: AppColors.white,
                //       borderRadius: BorderRadius.circular(14),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.black.withOpacity(0.3),
                //             blurRadius: 20,
                //             spreadRadius: 2),
                //       ]),
                //   child: Container(
                //     padding: EdgeInsets.only(left: 17, right: 17),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           'Name',
                //           style: TextStyle(
                //               fontFamily: 'Poppins',
                //               fontSize: 14,
                //               fontWeight: FontWeight.w400,
                //               color: AppColors.black),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               'Ame',
                //               style: TextStyle(
                //                   fontFamily: 'Poppins',
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w400,
                //                   color: AppColors.black),
                //             ),
                //             SizedBox(width: 2,),
                //             Image.asset(
                //               'assets/images/arrow.png',
                //               height: 10,
                //               width: 10,
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
