import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/HeaderBack.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final List<String> entries = <String>['Payment Method', 'History', 'Invite Friends', 'Settings', 'Logout'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.primaryBackgroundColor,
            height: 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderBack(whichBack: 'whiteBack',),
                Padding(
                  padding: const EdgeInsets.only(left: 27, top: 35),
                  child: Text(
                    'Notification',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: AppColors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height-210 ,
            color: AppColors.secondaryBackgroundColor,
            child: ListView.separated(
                padding: EdgeInsets.only(top: 10),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) {
                       setState(() {
                         entries.removeAt(index);
                       });
                      },
                      background: Container(
                        color: AppColors.primaryBackgroundColor,
                        // margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: Text('Remove', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: AppColors.white
                        ),)
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 28, right: 28, top: 19, bottom: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${entries[index]}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              'Your booking #1234 has been suc...',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                      ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
