import 'package:flutter/material.dart';
import 'package:flygrs/Utils/res/colors.dart';
import 'package:flygrs/res/components/AppTextField.dart';
import 'package:flygrs/res/components/HeaderBack.dart';
import 'package:flygrs/res/components/NotificationHeader.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<String> entries = <String>['Payment Method', 'History', 'Invite Friends', 'Settings', 'Logout'];
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  bool isShowCalendar = false;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height / 2 -100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(27), bottomRight:  Radius.circular(27)),
                  color: AppColors.primaryBackgroundColor,
                ),
                child: Column(
                  children: [
                   const NotificationHeader(),
                    
                    Container(
                      margin: const EdgeInsets.only(left: 32, right: 32, top: 31),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Activity',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: AppColors.white),
                          ),
                          Container(
                            height: 28,
                            width: 137,
                            decoration: const BoxDecoration(
                              color: AppColors.secondaryBackgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(28))
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      isShowCalendar = !isShowCalendar;
                                    });
                                  },
                                  child:  const Text(
                                    'Jan-Feb 2023',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black),
                                  ),
                                ),

                                Image.asset(
                                  'assets/images/dropdown.png',
                                  height: 7,
                                  width: 14,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
          Positioned(
              top: 190,
              child: Container(
                height: MediaQuery.of(context).size.height-240,
                width: MediaQuery.of(context).size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),

                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 175,
                          margin: const EdgeInsets.only(bottom: 55),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(27),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 1),
                            ]),
                        child:
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 33,
                                left: 25,
                                right: 25,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/location.png',
                                          height: 23,
                                          width: 23,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Expanded(
                                            child:  Text(
                                              'Noida Sector 15, E-19',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.black),
                                            ),),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Image.asset(
                                        'assets/images/locationLine.png',
                                        height: 20,
                                        width: 1,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/location.png',
                                          height: 23,
                                          width: 23,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Expanded(
                                            child:  Text(
                                              'Anand Vihar Delhi, Phase 2',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.black),
                                            ),),
                                      ],
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25, bottom: 15),
                              child: Container(
                                height: 2,
                                width: MediaQuery.of(context).size.height-40,
                                color: AppColors.shinnySilver,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17, right: 17),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '\$ 25.00',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Completed',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black),
                                      ),
                                      const SizedBox(width: 10,),
                                      Image.asset(
                                        'assets/images/arrow.png',
                                        height: 10,
                                        width: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                      );
                    }
                ),
              )
          ),
          if(isShowCalendar)
          Positioned(
            height: 450,
            left: 32,
            top: MediaQuery.of(context).size.height/2-200,
            right: 32,

            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(27),
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
                    isShowCalendar=false;
                  });
                },
                view: DateRangePickerView.year,
                backgroundColor: AppColors.white,
                // onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,

              ),
            ),
          )
        ],
      ),
    );
  }
}
