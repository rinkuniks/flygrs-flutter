import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/res/components/AppTextField.dart';

class SignupLoginView extends StatefulWidget {
  const SignupLoginView({super.key});

  @override
  State<SignupLoginView> createState() => _SignupLoginViewState();
}

class _SignupLoginViewState extends State<SignupLoginView> {
  bool isSignupScreen = true;
  bool? obSecure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: isSignupScreen ? 280 : 200,
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackgroundColor,
                ),
                child: Container(
                  padding:
                      EdgeInsets.only(top: !isSignupScreen ? 70 : 80, left: 20),
                  color: AppColors.secondaryBackgroundColor,
                  child: Column(children: [
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/getStartedImage.png',
                        height: 80,
                        width: 80,
                      ),
                    ),
                    if (isSignupScreen)
                      Text(
                        "Hello Again!",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBackgroundColor,
                        ),
                      ),
                    if (isSignupScreen)
                      Container(
                        width: 228,
                        child: Text(
                          "Welcome back you've been missed!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: AppColors.primaryBackgroundColor,
                          ),
                        ),
                      ),
                  ]),
                ),
              )),
          buildBottomHalfContainer(true),
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 280 : 180,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 280 : 410,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 58,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isSignupScreen = true;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: isSignupScreen
                                          ? AppColors.primaryBackgroundColor
                                          : AppColors.secondaryBackgroundColor),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: isSignupScreen
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16),
                                  )),
                            )),
                            Expanded(
                                child: SizedBox(
                              height: 58,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isSignupScreen = false;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: isSignupScreen
                                          ? AppColors.secondaryBackgroundColor
                                          : AppColors.primaryBackgroundColor),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: !isSignupScreen
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16),
                                  )),
                            )),
                          ],
                        ),
                        if (!isSignupScreen) buildSignupSection(),
                        if (isSignupScreen) buildSigninSection()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 200,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  // margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/checkbox.png',
                        height: 17,
                        width: 17,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "I accept all terms and conditions",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/leftLine.png',
                      width: 68,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Or Continue with"),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/rightLine.png',
                      width: 68,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 80, left: 80, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton(
                          Image.asset(
                            'assets/images/google.png',
                            height: 53,
                            width: 53,
                          ),
                          "Facebook",
                          Colors.blue),
                      buildTextButton(
                          Image.asset(
                            'assets/images/apple.png',
                            height: 53,
                            width: 53,
                          ),
                          "Google",
                          Colors.green),
                      buildTextButton(
                          Image.asset(
                            'assets/images/facebook.png',
                            height: 53,
                            width: 53,
                          ),
                          "Google",
                          Colors.green),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          AppTextField(
            hintText: "info@demouri.com",
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextField(
            hintText: "**********",
            isPassword: true,
            obSecure: true,
            keyboardType: TextInputType.text,
          ),
          Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.takeMeHome);
                      },
                      child: Text("Remember Me",
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColors.rememberMeButtonColor,
                              fontWeight: FontWeight.w300)),
                    )
                  ],
                ),
                Text(
                  '|',
                  style: TextStyle(
                      fontSize: 10, color: AppColors.rememberMeButtonColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password",
                      style: TextStyle(
                          fontSize: 10,
                          color: AppColors.rememberMeButtonColor,
                          fontWeight: FontWeight.w300)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          AppTextField(
            hintText: "Name",
            isPassword: false,
            keyboardType: TextInputType.text,
          ),
          AppTextField(
            hintText: "Email",
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextField(
            hintText: "Password",
            isPassword: true,
            obSecure: true,
            keyboardType: TextInputType.text,
          ),
          AppTextField(
            hintText: "Confirm Passwrod",
            isPassword: false,
            obSecure: true,
            keyboardType: TextInputType.text,
          ),
          AppTextField(
            hintText: "Phone No.",
            isPassword: false,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(Image iconImg, title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          ClipRRect(child: iconImg),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 565,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 48,
          width: 222,
          // padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.gradient1,
                        AppColors.gradient2,
                        AppColors.gradient3,
                      ], stops: [
                        0.0,
                        0.5,
                        0.9
                      ]),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text(
                      !isSignupScreen ? 'Sign Up' : 'Sign In',
                      style: TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                  ))
              : Center(),
        ),
      ),
    );
  }
}
