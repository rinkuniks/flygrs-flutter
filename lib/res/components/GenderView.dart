import 'package:flutter/material.dart';

import '../../Utils/res/colors.dart';
import 'Dropdown.dart';

class GenderView extends StatefulWidget {
   GenderView({
    super.key,
    this.onSelectParam,
     this.defaultOption,
     this.isEdit
  });
  Function(String)? onSelectParam;
  String? defaultOption;
  bool? isEdit;

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {
  String dropdownvalue = 'male';

  // List of items in our dropdown menu
  var items = [
    'male',
    'female',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                // Dropdown(items: items),
                (widget.isEdit == false) ? Text(widget.defaultOption ?? 'male') :
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      widget.onSelectParam!(newValue!);
                    });
                  },
                ),
                SizedBox(
                  width: 2,
                ),
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
