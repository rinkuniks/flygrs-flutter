
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flygrs/Utils/constant.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/generated/assets.dart';
import 'package:flygrs/res/components/GenderView.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
import 'package:flygrs/res/components/ProfileShadowView.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/util.dart';
import '../../res/components/AppGradientButton.dart';
import '../../res/components/Dropdown.dart';
class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override

  File? image;
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Column(
        children: [
         const HeaderBack(whichBack: Constant.LBL_BLUEBACK,),
          Padding(
            padding: const EdgeInsets.only(top: 11.0, left: 24, right: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Constant.LBL_MY_PROFILE,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBackgroundColor),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    InkWell(
                      child:
                          (image != null)
                           ? CircleAvatar(
                              radius: 40,
                              child: ClipOval(child: Image.file(image!, width: 80, height: 80, fit: BoxFit.cover,))
                          )
                           : Image.asset(
                        Assets.assetsProfile,
                        height: 79,
                        width: 79,
                      ),
                      onTap: () {
                        showImagePickerBottomSheet(context);
                      },
                    ),
                    SvgPicture.asset(Assets.assetsEdit, width: 25, height: 25,)
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 81, left: 24, right: 28),
            height: MediaQuery.of(context).size.height-300,
            child: Column(
              children: [
                ProfileShadowView(title1: Constant.LBL_NAME, title2: 'Ame', controller: nameController,),
                SizedBox(height: 10,),
                ProfileShadowView(title1: Constant.LBL_EMAIL_ADDRESS, title2: 'xyz@gmail.com', controller: emailController, keyboardType: TextInputType.emailAddress,),
                SizedBox(height: 10,),
                ProfileShadowView(title1: Constant.LBL_MOBILE_NUMBER, title2: '0000 00 0000', controller: mobileController, keyboardType: TextInputType.phone,),
                SizedBox(height: 10,),
                GenderView(),
                SizedBox(height: 10,),
                ProfileShadowView(title1: Constant.LBL_BIRTHDAY, title2: 'DD/MM/YYYY', controller: dateController, onTap: () async {
                  print("DAte Picker");
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );

                },),
                SizedBox(height: 20,),
                AppGradientButton(
                    topLeftCorner: 14,
                    topRightCorner: 14,
                    bottomRightCorner: 14,
                    bottomLeftCorner: 14,
                    height: 50,
                    title: 'Update',
                    onTap: () {
                    }
                ),
                // ProfileShadowView(title1: 'Change Password', title2: 'xxxxxxx',),
                // Container(
                //   height: 58,
                //   decoration: BoxDecoration(
                //       color: AppColors.white,
                //       borderRadius: BorderRadius.circular(14),
                //       boxShadow: [
                //         BoxShadow(
                //             color: Colors.black.withOpacity(0.3),
                //             blurRadius: 20,
                //             spreadRadius: 2),
                //       ]),
                //   child: Container(
                //     padding: EdgeInsets.only(left: 17, right: 17),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           'Name',
                //           style: TextStyle(
                //               fontFamily: 'Poppins',
                //               fontSize: 14,
                //               fontWeight: FontWeight.w400,
                //               color: AppColors.black),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               'Ame',
                //               style: TextStyle(
                //                   fontFamily: 'Poppins',
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.w400,
                //                   color: AppColors.black),
                //             ),
                //             SizedBox(width: 2,),
                //             Image.asset(
                //               'assets/images/arrow.png',
                //               height: 10,
                //               width: 10,
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
  showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context, builder: (BuildContext context) {
      return Wrap(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: AppColors.primaryBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                const Text(Constant.LBL_PICKCAMERA_MSG, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.white),),
                SizedBox(height: 30,),
                InkWell(
                  onTap: () {
                    pickImage();
                  },
                    child: const Text(Constant.LBL_PICKGALLERY_MSG, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.white),)
                ),
                SizedBox(height: 50,),
              ],
            ),
          )
        ],
      );
    }
    );
  }
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() =>
        this.image = imageTemp,
      );
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  updateProfileApiCall(BuildContext context) async {
    if (Utils.validName(nameController.text).isEmpty &&
        Utils.validEmail(emailController.text).isEmpty &&
        Utils.validPhone(mobileController.text).isEmpty) {
      Map data = {
        "name": nameController.text,
        "email": emailController.text,
        "phone": mobileController.text,
        // "gender": confirmPasswordC.text,
        // "dob": phoneC.text,
        //"profile_image":
      };
      // signUpViewModel.signUpApi(data, context);
    }
  }
}
