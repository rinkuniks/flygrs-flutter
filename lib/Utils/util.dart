import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';

class Utils{

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: AppColors.primaryBackgroundColor,
        content: Text(message)));
  }

}