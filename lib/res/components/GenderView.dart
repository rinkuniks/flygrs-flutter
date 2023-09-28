import 'package:flutter/material.dart';

import '../../Utils/res/colors.dart';
import 'Dropdown.dart';

class GenderView extends StatefulWidget {
  const GenderView({super.key});

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {

  // Initial Selected Value
  String dropdownvalue = 'Item 1';
  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 58,
        padding: EdgeInsets.only(left: 17, right: 17),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 2),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gender',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black),
            ),
            Row(
              children: [
                Dropdown(items: items),
                SizedBox(width: 2,),
                Image.asset(
                  'assets/images/arrow.png',
                  height: 10,
                  width: 10,
                ),
              ],
            ),
          ],
        )
    );
  }
}
