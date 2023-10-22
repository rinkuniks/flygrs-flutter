import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/Utils/route/routeName.dart';
import 'package:flygrs/res/components/NotificationHeader.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

import '../../Utils/util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  bool isShowCalendar = false;
  String? dateStr;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        print(_range);
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }
  showMyDatePicker(BuildContext context) async {

  }
  refreshOnTap(String str) {
    setState(() {
      if (str == "Days") {
        isShowCalendar = !isShowCalendar;
      } else {

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(left: 24,top: 30),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NotificationHeader(),
                      FutureBuilder<String>(
                        future: Utils.getStringValuesSF('name'),
                        builder:
                            (BuildContext context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            final theText = snapshot.data;
                            return Text("Hello , ${theText} !",style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: AppColors.white),
                            );
                          }//While awaiting show the loading indicator
                          return Container();
                        },
                      ),
                      Text(
                        "Where do you want to go?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: Container(
                        color: AppColors.white,
                        child: Column(
                          children: [
                            homeScreenComponent(context, "Park My Car", "assets/images/car_park.svg", refreshOnTap),
                            homeScreenTwoComponent(context, "Take Me Home","assets/images/takeMeHome.svg"),
                            homeScreenTwoComponent(context, "Chauffeur Me","assets/images/chauffeur.svg")
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
          if (isShowCalendar)
            Positioned(
              height: 450,
              left: 30,
              top: MediaQuery.of(context).size.height / 2 - 200,
              right: 30,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 1),
                    ]),
                child: SfDateRangePicker(
                  showActionButtons: true,
                  // onSubmit: (Object value) {
                  //   Navigator.pop(context);
                  // },
                  onCancel: () {
                    setState(() {
                      isShowCalendar = false;
                    });
                  },
                  view: DateRangePickerView.month,
                  backgroundColor: AppColors.white,
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                ),
              ),
            )
        ],
      )

    );
  }
}

Widget homeScreenComponent(BuildContext context, String title, String image, Function? notifyClick) {

  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 36),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 5
            ),
          ],
          color: AppColors.secondaryBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(image)),
              SizedBox(
                width: 85,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBackgroundColor),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MaterialButton(
                  child: Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/btnBg.png"),
                            fit: BoxFit.cover),

                      ),
                      child: const Text("Days",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: AppColors.white))),
                  onPressed: () {
                    notifyClick!("Days");
                    // setState
                  }),
              MaterialButton(
                  child: Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/btnGreyBg.png"),
                            fit: BoxFit.cover),
                      ),
                      child: const Text("Hours",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              color: AppColors.primaryBackgroundColor))),
                  onPressed: () async {
                    // notifyClick!("Hours");
                    final result = await TimePicker.show<DateTime?>(
                      context: context,
                      sheet: TimePickerSheet(
                        sheetTitle: 'Select parking duration',
                        minuteTitle: 'Minute',
                        hourTitle: 'Hour',
                        saveButtonColor: AppColors.primaryBackgroundColor,
                        saveButtonText: 'Save',
                      ),
                    );
                    if (result != null) {
                     print("HOURS: ${result.hour}----MINUTES: ${result.minute}");
                     Navigator.pushNamed(context, RouteName.bookingScreen);
                    }
                  })
            ],
          ),
        ],
      ),
    ),
  );
}

Widget homeScreenTwoComponent(BuildContext context, String title, String image) {
  return Container(
    margin: const EdgeInsets.only(left: 28, right: 28, top: 28),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 5
          ),
        ],
        color: AppColors.secondaryBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(15))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: SvgPicture.asset(image)),
            SizedBox(
              width: 85,
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBackgroundColor),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MaterialButton(
                child: Container(
                    width: 120,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/btnBg.png"),
                          fit: BoxFit.cover),
                    ),
                    child: const Text("Book Now",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                            color: AppColors.white))),
                onPressed: () {
                   if (title == 'Take Me Home') {
                     Navigator.pushNamed(context, RouteName.takeMeHome);
                   } else {
                     Navigator.pushNamed(context, RouteName.bookingScreen);
                   }
                }),
          ],
        ),
      ],
    ),
  );
}
