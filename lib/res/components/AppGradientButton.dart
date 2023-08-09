import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';

class AppGradientButton extends StatefulWidget {
  AppGradientButton({
    super.key,
    this.title,
    this.width,
    this.height,
    this.topLeftCorner,
    this.topRightCorner,
    this.bottomLeftCorner,
    this.bottomRightCorner
  });

  final String? title;
  final double? width;
  final double? height;
  final double? topLeftCorner;
  final double? topRightCorner;
  final double? bottomLeftCorner;
  final double? bottomRightCorner;

  @override
  _AppGradientButtonState createState() => _AppGradientButtonState();
}

class _AppGradientButtonState extends State<AppGradientButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: GestureDetector(
          child: Container(
              width: widget.width,
              height: widget.height,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.topLeftCorner ?? 0),
                    topRight: Radius.circular(widget.topRightCorner ?? 0),
                    bottomLeft: Radius.circular(widget.bottomLeftCorner ?? 0),
                    bottomRight: Radius.circular(widget.bottomRightCorner ?? 0)),
                image: DecorationImage(
                    image: AssetImage("assets/images/btnBg.png"),
                    fit: BoxFit.cover),
              ),
              child: Text(widget.title ?? "",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      color: AppColors.white))),
          onTap: () {}),
    );
  }
}
