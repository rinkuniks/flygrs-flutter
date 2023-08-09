import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
class ProfileShadowView extends StatefulWidget {
  const ProfileShadowView({
    super.key,
    this.title1,
    this.title2
  });
  final String? title1;
  final String? title2;
  @override
  State<ProfileShadowView> createState() => _ProfileShadowViewState();
}

class _ProfileShadowViewState extends State<ProfileShadowView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 2),
          ]),
      child: Container(
        padding: EdgeInsets.only(left: 17, right: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.title1}',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.title2}',
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
    );
  }
}
