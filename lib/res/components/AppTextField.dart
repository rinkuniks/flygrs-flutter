import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';

class AppTextField extends StatefulWidget {
  AppTextField({
    super.key,
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.helperText,
    this.prefixText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.isPassword,
    this.obSecure,
    this.onChanged,
    this.fontSize,
    this.height,
    this.initialValue,
    this.maxLine,
    this.keyboardType,
    this.readOnly,
    this.textFieldOnTap,
    this.textFieldColor,
    this.textFieldBorderColor,
    this.textFieldFocusColor,
    this.prefixIcon,
    this.textInputAction,
    this.borderRadius,
  });

  final double? fontSize;
  final Key? fieldKey;
  final int? maxLength;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? prefixText;
  final textFieldColor;
  final textFieldBorderColor;
  final textFieldFocusColor;
  FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onChanged;

  final bool? isPassword;
  bool? obSecure;
  final int? height;
  final String? initialValue;
  final int? maxLine;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function? textFieldOnTap;
  final String? prefixIcon;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: widget.obSecure ?? false,
        keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
        decoration: InputDecoration(
          // prefixIcon: Icon(
          //   icon,
          //   color: Colors.grey,
          // ),
          suffixIcon: widget.isPassword == null || widget.isPassword == false
              ? null
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.obSecure = !widget.obSecure!;
                    });
                  },
                  child: Icon(
                    widget.obSecure != null && widget.obSecure!
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.grey,
                  ),
                ),
          fillColor: AppColors.textFieldBackgroundColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.shinnySilver),
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
