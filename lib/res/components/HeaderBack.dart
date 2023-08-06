import 'package:flutter/material.dart';

class HeaderBack extends StatefulWidget {
  const HeaderBack({
    this.whichBack,
    super.key
  });

  final String? whichBack;
  @override
  State<HeaderBack> createState() => _HeaderBackState();
}

class _HeaderBackState extends State<HeaderBack> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 80, left: 29, ),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  'assets/images/${widget.whichBack}.png',
                  height: 30,
                  width: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
