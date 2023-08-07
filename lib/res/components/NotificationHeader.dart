import 'package:flutter/material.dart';
import 'package:flygrs/Utils/route/routeName.dart';

class NotificationHeader extends StatefulWidget {
  const NotificationHeader({super.key});

  @override
  State<NotificationHeader> createState() => _NotificationHeaderState();
}

class _NotificationHeaderState extends State<NotificationHeader> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 40, right: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteName.notification);
            },
            child: Image.asset(
              'assets/images/notification.png',
              height: 23,
              width: 23,
            ),
          )
        ],
      ),
    );
  }
}
