import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/AppTextField.dart';
import '../../res/components/AppTextField.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/getStartedImage.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 50,
                              child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          AppColors.primaryBackgroundColor),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )),
                            Expanded(
                                child: SizedBox(
                              height: 50,
                              child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          AppColors.secondaryBackgroundColor),
                                  child: Text("Sign In")),
                            )),
                          ],
                        ),
                        AppTextField(
                            textInputAction: TextInputAction.done,
                            validator: (input) {
                              // String? validatorString =
                              //     Validation.passwordValidator(input, context);
                              // if (validatorString.isNotEmpty) {
                              //   return validatorString;
                              // }
                              // return null;
                            },
                            // fieldKey: _passwordFieldKey,
                            //  hintText: 'Password',
                            obSecure: false,
                            isPassword: false,
                            onSaved: (input) => {}
                            //_password = input.toString(),
                            ),
                        AppTextField(
                            textInputAction: TextInputAction.done,
                            validator: (input) {
                              // String? validatorString =
                              //     Validation.passwordValidator(input, context);
                              // if (validatorString.isNotEmpty) {
                              //   return validatorString;
                              // }
                              // return null;
                            },
                            // fieldKey: _passwordFieldKey,
                            //  hintText: 'Password',
                            obSecure: false,
                            isPassword: false,
                            onSaved: (input) => {}
                            //_password = input.toString(),
                            ),
                        AppTextField(
                            textInputAction: TextInputAction.done,
                            validator: (input) {
                              // String? validatorString =
                              //     Validation.passwordValidator(input, context);
                              // if (validatorString.isNotEmpty) {
                              //   return validatorString;
                              // }
                              // return null;
                            },
                            // fieldKey: _passwordFieldKey,
                            //  hintText: 'Password',
                            obSecure: false,
                            isPassword: false,
                            onSaved: (input) => {}
                            //_password = input.toString(),
                            ),
                        AppTextField(
                            textInputAction: TextInputAction.done,
                            validator: (input) {
                              // String? validatorString =
                              //     Validation.passwordValidator(input, context);
                              // if (validatorString.isNotEmpty) {
                              //   return validatorString;
                              // }
                              // return null;
                            },
                            // fieldKey: _passwordFieldKey,
                            //  hintText: 'Password',
                            obSecure: false,
                            isPassword: false,
                            onSaved: (input) => {}
                            //_password = input.toString(),
                            ),
                        AppTextField(
                            textInputAction: TextInputAction.done,
                            validator: (input) {
                              // String? validatorString =
                              //     Validation.passwordValidator(input, context);
                              // if (validatorString.isNotEmpty) {
                              //   return validatorString;
                              // }
                              // return null;
                            },
                            // fieldKey: _passwordFieldKey,
                            //  hintText: 'Password',
                            obSecure: false,
                            isPassword: false,
                            onSaved: (input) => {}
                            //_password = input.toString(),
                            ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryBackgroundColor),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height*0.1,
          //   width: MediaQuery.of(context).size.width,
          //   color: AppColors.primaryBackgroundColor,
          //   child: Column(
          //     children: [
          //       Container(
          //         child: ClipRRect(
          //           child: Image.asset(
          //             'assets/images/getStartedImage.png',
          //             height: 50,
          //             width: 50,
          //           ),
          //         ),
          //       ),
          //       Container(
          //         height: 300,
          //         color: AppColors.white,
          //         child: Column(
          //
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ));
  }
}
