import 'package:flutter/material.dart';
import 'package:flygrs/Utils/constant.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/Utils/util.dart';
import 'package:flygrs/res/components/NotificationHeader.dart';
import 'package:flygrs/view_model/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/components/BaseAlertDialog.dart';
import '../../view_model/auth_view_model.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final List<Map<String, String>> entries = <Map<String, String>>[
    {'title': 'Payment Method', 'image': 'assets/images/payment.png'},
    {'title': 'History', 'image': 'assets/images/history.png'},
    {'title':'Invite Friends', 'image': 'assets/images/invite.png'},
    {'title': 'Settings', 'image': 'assets/images/setting.png'},
    {'title': 'Logout', 'image': 'assets/images/logout.png'}
  ];

  ProfileViewModel profileViewModel = ProfileViewModel();
  late AuthViewModel authViewModel = AuthViewModel();

  @override
  void initState() {
    profileViewModel.fetchProfileDataApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height / 2-120,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(27), bottomLeft: Radius.circular(27)),
                  color: AppColors.primaryBackgroundColor,
                ),
              child: Column(
                children: [
                  const NotificationHeader(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20, left: 30,right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Constant.LBL_APPLE,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/profile.png',
                                    height: 79,
                                    width: 79,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: ChangeNotifierProvider<ProfileViewModel>(
                                      create: (BuildContext context) => profileViewModel,
                                      child: Consumer<ProfileViewModel>(builder: (context, value, _) {
                                        return Column(
                                          children: [
                                             Text(
                                              '${value.profileData?.data?.data?.name}',
                                              style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.white),
                                            ),
                                            const SizedBox(height: 2,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/ratingStar.png',
                                                  height: 19,
                                                  width: 19,
                                                ),

                                                const Padding(
                                                  padding: EdgeInsets.only(left: 3.0),
                                                  child: Text(
                                                    '4.5',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w300,
                                                        color: AppColors.white),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      }
                                      )
                                    )
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                 Navigator.pushNamed(context, RouteName.editProfile);
                                },
                                child: Image.asset(
                                  'assets/images/next.png',
                                  height: 19,
                                  width: 19,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height/2 - 120) ,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height/2 - 120),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 47, left: 28, right: 24),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 51,
                            margin: const EdgeInsets.only(bottom: 15),
                            child: GestureDetector(
                              child: Row(
                                children: [
                                  Image.asset(
                                    '${entries[index]['image']}',
                                    height: 51,
                                    width: 51,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      '${entries[index]['title']}',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){
                                if(index==3) {
                                  Navigator.pushNamed(context, RouteName.settingScreen);
                                } else  if (index==4) {
                                  _confirmLogout();
                                }
                              },
                            )
                            // Center(child: Text('Entry ${entries[index]}')),
                          );
                        }
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
  _confirmLogout() {
    var baseDialog = BaseAlertDialog(
        title: Constant.LBL_CONFIRM,
        content: Constant.LBL_CONFIRM_MSG,
        yesOnPressed: () {
          authViewModel.logOutApi(context);
        },
        noOnPressed: () {
          Navigator.of(context, rootNavigator: true)
              .pop(false);
        },
        yes: Constant.LBL_YES,
        no: Constant.LBL_NO
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }
}
