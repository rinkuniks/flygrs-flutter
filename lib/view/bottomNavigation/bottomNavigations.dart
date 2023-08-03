import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flygrs/view/account/account.dart';
import 'package:flygrs/view/activity/activity.dart';
import 'package:flygrs/view/home/home_screen.dart';
import '../../Utils/res/colors.dart';

class BottomNavigation extends StatelessWidget {

  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
    );
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
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(Assets.assetsHomeIcon, color: AppColors.grey,),
            label: 'Home',
            activeIcon: SvgPicture.asset(Assets.assetsHomeIcon,color: AppColors.primaryBackgroundColor),

          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(Assets.assetsMyCourses),
            activeIcon: SvgPicture.asset(Assets.assetsMyCourses,color: AppColors.primaryBackgroundColor),
            label: 'My Course',
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(Assets.assetsMessage),
            activeIcon: SvgPicture.asset(Assets.assetsMessage,color: AppColors.primaryBackgroundColor),
            label: 'Message',
          ),
        ],
        currentIndex: _selectedIndex,
        enableFeedback: false,
        showSelectedLabels: true, // Selected labels hide/show
        showUnselectedLabels: true, // Unselected labels hide/show
        selectedItemColor: AppColors.primaryTextColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Icons and labels animation  
      ),
    );
  }
}
