import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
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
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
