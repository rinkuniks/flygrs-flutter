import 'package:flutter/material.dart';
import 'package:flygrs/Utils/constant.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/res/components/AppTextField.dart';
import 'package:flygrs/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../Utils/util.dart';
import '../../view_model/auth_view_model.dart';

class SignupLoginView extends StatefulWidget {
  const SignupLoginView({super.key});

  @override
  State<SignupLoginView> createState() => _SignupLoginViewState();
}

class _SignupLoginViewState extends State<SignupLoginView> {
  bool isSignupScreen = true;
  bool? obSecure;
  bool isChecked = false;
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  late AuthViewModel loginViewModel = AuthViewModel();

  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginViewModel = Provider.of<AuthViewModel>(context);
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
                decoration: const BoxDecoration(
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
                      const Text(
                        "Hello Again!",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBackgroundColor,
                        ),
                      ),
                    if (isSignupScreen)
                      const SizedBox(
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
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 280 : 180,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 280 : 410,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
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
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          color: isSignupScreen
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16),
                                    ),
                                  ))),
                          Expanded(
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
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: !isSignupScreen
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 16),
                                    ),
                                  ))),
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
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 200,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Image.asset(
                        isChecked
                            ? 'assets/images/selectedCheckbox.png'
                            : 'assets/images/checkbox.png',
                        height: 17,
                        width: 17,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "I accept all terms and conditions",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/leftLine.png',
                      width: 68,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Or Continue with"),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/rightLine.png',
                      width: 68,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          AppTextField(
            hintText: "info@demouri.com",
            isPassword: false,
            controller: emailC,
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextField(
            hintText: "**********",
            isPassword: true,
            obSecure: true,
            controller: passwordC,
            keyboardType: TextInputType.text,
          ),
          SizedBox(
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
                      child: const Text("Remember Me",
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColors.rememberMeButtonColor,
                              fontWeight: FontWeight.w300)),
                    )
                  ],
                ),
                const Text(
                  '|',
                  style: TextStyle(
                      fontSize: 10, color: AppColors.rememberMeButtonColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password",
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
      margin: const EdgeInsets.only(top: 20),
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
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 565,
      right: 0,
      left: 0,
      child: Center(
          child: InkWell(
        onTap: () {
          !isSignupScreen ? signUpApiCall(context) : loginApiCall();
        },
        child: Container(
          height: 48,
          width: 222,
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
                      gradient: const LinearGradient(colors: [
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
                            offset: const Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text(
                      !isSignupScreen ? 'Sign Up' : 'Sign In',
                      style:
                          const TextStyle(color: AppColors.white, fontSize: 16),
                    ),
                  ))
              : const Center(),
        ),
      )),
    );
  }

  loginApiCall() async {
    print("----------Sign In");
    if (emailC.text.isEmpty ) {
      Utils.toastMessage("Please enter email id ");
    }else if(!Constant.EMAILVALID.hasMatch(emailC.text)){
      Utils.toastMessage("Please enter valid email id ");
    } else if(passwordC.text.isEmpty){
      Utils.toastMessage("Please enter your password ");
    } else if(passwordC.text.length <= 6) {
      Utils.toastMessage("Please enter least 6 digit password");
    }else {
      Map data = {
        "email": emailC.text,
        "password": passwordC.text,
      };
      loginViewModel.loginApi(data, context);
    }
  }

  signUpApiCall(BuildContext context) async {
    print("----------Sign Up");
    Navigator.pushNamed(context, RouteName.bottomNavigation);
  }
}
