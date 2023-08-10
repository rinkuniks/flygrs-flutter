import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/HeaderBack.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  final List<String> settingOptions = ['Privacy', 'Help', 'Security', 'FAQ'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBack(whichBack: 'blueBack',),
          Container(
            margin: EdgeInsets.only(top: 35,left: 29),
            child:  Text(
              'Settings',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBackgroundColor),
            ),
          ),
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width - 58,
            margin: const EdgeInsets.symmetric(horizontal: 29),
            child: ListView.builder(
                padding: EdgeInsets.only(top: 35),
                itemCount: settingOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpandableListView(title: "${settingOptions[index]}");
                }
            ),
          )
        ],
      ),
    );
  }
}


class ExpandableListView extends StatefulWidget {
  final String? title;

  const ExpandableListView({super.key, this.title});

  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        children: <Widget>[
          Container(
            // color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryBackgroundColor,
                      fontSize: 16
                  ),
                ),
                IconButton(
                    icon: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        expandFlag = !expandFlag;
                      });
                    }),
              ],
            ),
          ),
           ExpandableContainer(
              expanded: expandFlag,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 92,
                    decoration:
                    BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("2-step verification",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black
                                ),
                              ),
                              Text("Unavailable",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.black
                                ),
                              )
                            ],
                          ),
                          Text("2-step verification is not available for you at the movement. To proceed, please complete your profile",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: AppColors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 1,
              ))
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 100.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        // decoration: new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}
