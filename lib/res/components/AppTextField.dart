import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';

class AppTextField extends StatefulWidget {
  AppTextField({super.key,
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
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.shinnySilver
        ),
        child: TextFormField(
          //style: TextStyle(height: widget.height),
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          onChanged: widget.onChanged ?? (value) => {},
          readOnly: widget.readOnly ?? false,
          onTap: () => widget.textFieldOnTap !=null ? widget.textFieldOnTap!() : null,
          key: widget.fieldKey,
          obscureText: widget.obSecure ?? false,
          keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
          initialValue:
          widget.initialValue != null ? widget.initialValue.toString() : '',
          maxLength: widget.maxLength ??
              254, // if not provided by the user, then it is 8
          onSaved: widget.onSaved,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          maxLines: widget.maxLine ?? 1,
          decoration: InputDecoration(
            // prefixIcon: widget.prefixIcon != null
            //     ? Container(
            //         child: Text('\$800'),
            //       )
            //     : Container(
            //         child: Text('\$800'),
            //       ),
            errorMaxLines: 5,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget?.prefixIcon != null
                    ? Text(
                  widget?.prefixIcon ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                )
                    : Container(),
              ],
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: widget?.prefixIcon != null ? 35 : 15,
              minHeight: 25,
            ),
            // prefixIconConstraints:BoxConstraints(maxWidth: 40)),
            counterText: "",
            // prefixStyle: TextStyle(),
            fillColor: widget.textFieldColor ?? AppColors.shinnySilver,
            contentPadding: const EdgeInsets.only(left: 15, right: 15, top: 13),
            isDense: false,
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(widget.borderRadius ??  0.0),
            //   borderSide: widget.textFieldBorderColor ??
            //       const BorderSide(color: AppColors.grey, width: 1.0),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(widget.borderRadius ??  0.0),
            //   borderSide: BorderSide(
            //     color: widget.textFieldFocusColor ?? Colors.black,
            //     width: 1.0,
            //   ),
            // ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(widget.borderRadius ??  0.0),
            //   borderSide: const BorderSide(
            //     color: Colors.black,
            //     width: 1.0,
            //   ),
            // ),
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.grey, fontSize: 14),
            labelText: widget.labelText,
            // labelStyle: TextStyle(color: Palette.borderStroke,fontSize: 14,),hintMaxLines: 2,
            // alignLabelWithHint: true,
            // floatingLabelStyle: TextStyle(color: Palette.borderStroke),
            // floatingLabelAlignment: FloatingLabelAlignment.center,
            // alignLabelWithHint: true,
            // floatingLabelBehavior: FloatingLabelBehavior.auto,
            prefixText: widget.prefixText,prefixStyle: const TextStyle(color: Colors.black),
            helperText: widget.helperText,
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
          ),
        ),
      ),
    );
  }
}