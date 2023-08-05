import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flygrs/view/account/account.dart';
import 'package:flygrs/view/activity/activity.dart';
import 'package:flygrs/view/home/home_screen.dart';
import '../../Utils/res/Assets.dart';
import '../../Utils/res/colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  final _pageOptions = [
    const HomeScreen(),
    const ActivityScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.home,
                  color: AppColors.grey,
                  matchTextDirection: true,
                ),
                label: 'Home',
                activeIcon: SvgPicture.asset(Assets.home,
                    color: AppColors.primaryBackgroundColor),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.activity,
                    color: AppColors.grey, matchTextDirection: true),
                activeIcon: SvgPicture.asset(Assets.activity,
                    color: AppColors.primaryBackgroundColor),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.account,
                    color: AppColors.grey, matchTextDirection: true),
                activeIcon: SvgPicture.asset(Assets.account,
                    color: AppColors.primaryBackgroundColor),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            enableFeedback: false,
            showSelectedLabels: true,
            // Selected labels hide/show
            showUnselectedLabels: true,
            // Unselected labels hide/show
            selectedItemColor: AppColors.primaryBackgroundColor,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed, // Icons and labels animation
          ),
        ),
      ),
    );
  }
}
