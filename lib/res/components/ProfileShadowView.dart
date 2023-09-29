import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/AppTextField.dart';
import 'package:flygrs/res/components/Dropdown.dart';

import '../../Utils/constant.dart';
class ProfileShadowView extends StatefulWidget {
  const ProfileShadowView({
    super.key,
    this.title1,
    this.title2,
    this.isDropdown,
    this.items,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.isEnabled

  });
  final String? title1;
  final String? title2;
  final bool? isDropdown;
  final List<String>? items;
  final TextEditingController? controller;
  final Function? onTap;
  final TextInputType? keyboardType;
  final bool? isEnabled;

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
                SizedBox(
                  width: 120,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      enabled: widget.isEnabled,
                      readOnly: (widget.title1 == Constant.LBL_BIRTHDAY) ? false : true ,
                      textAlign: TextAlign.right,
                      controller: widget.controller,
                      keyboardType: widget.keyboardType ?? TextInputType.text,
                      onTap: (){widget.onTap!();},
                      decoration: InputDecoration(

                        border: InputBorder.none,
                        labelText: '${widget.title2}',
                        hintText: '${widget.title2}',
                        hintStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black),
                      ),
                    ),
                    //: Dropdown(items: widget.items!),
                  )

                ),
                // Text(
                //   '${widget.title2}',
                //   style: TextStyle(
                //       fontFamily: 'Poppins',
                //       fontSize: 14,
                //       fontWeight: FontWeight.w400,
                //       color: AppColors.black),
                // ),
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
