import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flygrs/Utils/res/colors.dart';

import 'constant.dart';

class Utils{

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: AppColors.primaryBackgroundColor,
        content: Text(message)));
  }

  static toastMessage(String? message) {
    Fluttertoast.showToast(msg: message.toString());
  }

  static void flushBarError(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.all(30),
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(30),
          duration: const Duration(seconds: 2),
        )..show(context));
  }

  static String validName(String name){
    if (name.isEmpty) {
      return Utils.toastMessage("Please enter name");
    }
    return "";
  }

  static String validEmail(String email){
    if (email.isEmpty) {
      return Utils.toastMessage("Please enter email id");
    }else if(!Constant.EMAILVALID.hasMatch(email)){
      return Utils.toastMessage("Please enter valid email id ");
    }
    return "";
  }

  static String validPassword(String pass){
    if (pass.isEmpty) {
      return Utils.toastMessage("Please enter your password");
    }else if(pass.length <= 5){
      return Utils.toastMessage("Please enter least 6 digit password");
    }
    return "";
  }

  static String validPhone(String phone){
    if (phone.isEmpty) {
      return Utils.toastMessage("Please enter your Mobile number");
    }else if(phone.length <= 9){
      return Utils.toastMessage("Please enter 10 digit");
    }else if(!Constant.PHONEVALID.hasMatch(phone)){
      return Utils.toastMessage("Please enter valid mobile number");
    }
    return "";
  }

  static String comparePassword(String pass, String confPass){
    if (confPass.isEmpty) {
      return Utils.toastMessage("Please enter your password");
    }else if(confPass.length <= 5){
      return Utils.toastMessage("Please enter least 6 digit password");
    }else if (pass != confPass) {
      return Utils.toastMessage("Password do not match");
    }
    return "";
  }

  static disableLoader(BuildContext context){
    Navigator.of(context, rootNavigator: true).pop();
    //Navigator.pop(context);
  }

  static alertLoader(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              // width: MediaQuery.of(context).size.width * .02,
              child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}