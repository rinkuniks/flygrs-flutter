import 'package:flutter/material.dart';

import '../../Utils/res/colors.dart';

class BaseAlertDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  String _title = '';
  String _content = '';
  String _yes = '';
  String _no = '';
 late Function _yesOnPressed;
 late Function _noOnPressed;

  BaseAlertDialog({
    super.key,
    String title = "",
    String content = "",
    required Function yesOnPressed,
    required Function noOnPressed,
    String yes = "Yes",
    String no = "No"
  }){
    _title = title;
    _content = content;
    _yesOnPressed = yesOnPressed;
    _noOnPressed = noOnPressed;
    _yes = yes;
    _no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title, style: const TextStyle(color: AppColors.white),),
      content: Text(_content, style: const TextStyle(color: AppColors.white),),
      backgroundColor: AppColors.primaryBackgroundColor,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: <Widget>[
         TextButton(
          style: ButtonStyle(
             foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
           ),
          onPressed: () {
            _yesOnPressed();
          },
          child: Text(_yes),
        ),
         TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          ),
          onPressed: () {
            _noOnPressed();
          },
          child: Text(_no),
        ),
      ],
    );
  }
}