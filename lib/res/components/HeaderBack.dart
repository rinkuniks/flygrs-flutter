import 'package:flutter/material.dart';

class HeaderBack extends StatefulWidget {
  const HeaderBack({
    this.whichBack,
    this.isShare,
    super.key
  });

  final String? whichBack;
  final bool? isShare;
  @override
  State<HeaderBack> createState() => _HeaderBackState();
}

class _HeaderBackState extends State<HeaderBack> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 80, left: 29, right: 29),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
              if (widget.isShare == true)
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    'assets/images/share.png',
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
