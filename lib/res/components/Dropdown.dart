import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {

  final List<String> items;
  const Dropdown({
    super.key,
    required this.items
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {

  // Initial Selected Value
  String dropdownvalue = 'Male';

  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
      // Initial Value
      value: dropdownvalue,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      // Array list of items
      items: widget.items.map((String items) {
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
        });
      },
    );
  }
}
