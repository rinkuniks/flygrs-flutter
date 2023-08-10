import 'package:flutter/material.dart';
import 'package:flygrs/Utils/route/routeName.dart';

class NotificationHeader extends StatefulWidget {
  const NotificationHeader({
    super.key,
    this.isBack,
  });

  final bool? isBack;

  @override
  State<NotificationHeader> createState() => _NotificationHeaderState();
}

class _NotificationHeaderState extends State<NotificationHeader> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 40, right: 27, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.isBack == true)
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                'assets/images/whiteBack.png',
                height: 30,
                width: 30,
              ),
            ),
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
