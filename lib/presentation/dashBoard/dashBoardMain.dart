// ignore_for_file: file_names, camel_case_types, camel_case_types, duplicate_ignore, must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_cash/business_logic/dashboard/dashboard_cubit.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'dart:math' as math;



class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class dashBoardMain extends StatelessWidget {
  dashBoardMain({Key? key}) : super(key: key);

  final List<String> times = [
    'This Day',
    'This Week',
    'This Month',
  ];

  List<SalesData> inMony = [
  SalesData('Sat', 3500),
  SalesData('Sun', 750),
  SalesData('Mon', 4000),
  SalesData('Tue', 2450),
  SalesData('Wed', 560),
  SalesData('Thu', 7830),
  SalesData('Fri', 5350),


  ];
  List<SalesData> outMony = [
    SalesData('Sat', 3000),
    SalesData('Sun', 550),
    SalesData('Mon', 1350),
    SalesData('Tue', 6632),
    SalesData('Wed', 1050),
    SalesData('Thu', 530),
    SalesData('Fri', 465),


  ];
  List<SalesData> inMonyKid = [
    SalesData('Sat', 4000),
    SalesData('Sun', 250),
    SalesData('Mon', 5000),
    SalesData('Tue', 900),
    SalesData('Wed', 7800),
    SalesData('Thu', 133),
    SalesData('Fri', 990),


  ];
  List<SalesData> outMonyKid = [
    SalesData('Sat', 150),
    SalesData('Sun', 1000),
    SalesData('Mon', 444),
    SalesData('Tue', 8500),
    SalesData('Wed',790),
    SalesData('Thu', 7050),
    SalesData('Fri', 465),


  ];

  int? selectedPage = 0;
   PageController? _pageController;

  String selectedValue = "This Week";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => myApplication.keyboardFocus(context),
        child: Scaffold(
          body: Container(

            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Align(

                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Dash Board",
                    style: TextStyle(
                        fontSize: myApplication.widthClc(24, context),
                        fontWeight: FontWeight.bold),
                  ),

                ),

                SizedBox(
                  height: myApplication.hightClc(54, context),
                ),

                BlocConsumer<DashboardCubit, DashboardState>(

                  listener: (context, state) {

                    if (state is DashboardInitial) {
                      selectedPage = 0;
                      _pageController =
                          PageController(initialPage: selectedPage!);
                    }

                  },
                  builder: (context, state) {
                    return Column(

                      children: [

                        Row(
                          children: [
                            const Text(
                              "Dashboard Graph",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            DropdownButtonHideUnderline(

                                child: DropdownButton2(

                              onChanged: (val) {
                                selectedValue = val!;
                                BlocProvider.of<DashboardCubit>(context)
                                    .emit(DashbChooseTime());
                              },
                              value: selectedValue,
                              items: times
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style:  const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: myColors.blu,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )).toList(),

                              buttonStyleData: ButtonStyleData(
                                height: myApplication.hightClc(40, context),
                                width: myApplication.widthClc(150, context),

                                padding: const EdgeInsets.only(
                                    left: 14, right: 14),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(75),
                                  border: Border.all(
                                    width: 2.5,
                                    color: myColors.blu,
                                  ),
                                ),

                                elevation: 0,
                              ),

                              iconStyleData: IconStyleData(

                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: myApplication.widthClc(40, context),
                                ),

                                iconSize: 14,
                                iconEnabledColor: myColors.blu,
                                iconDisabledColor: myColors.blu,
                              ),

                              dropdownStyleData: DropdownStyleData(
                                  maxHeight: myApplication.hightClc(200, context),
                                  width: myApplication.widthClc(120, context),
                                  padding: null,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                  ),

                                  elevation: 8,
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness: MaterialStateProperty.all(6),
                                    thumbVisibility:
                                        MaterialStateProperty.all(true),
                                  )),

                              menuItemStyleData: MenuItemStyleData(
                                height: myApplication.hightClc(40, context),
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                              ),
                            )),
                          ],
                        ),

                        SizedBox(
                          height: myApplication.hightClc(40, context),
                        ),

                        SizedBox(
                          height: myApplication.hightClc(362, context),
                          child: PageView(

                            controller: _pageController,
                            onPageChanged: (page) {
                              selectedPage = page;
                              BlocProvider.of<DashboardCubit>(context)
                                  .emit(DashbChangePage());
                            },
                            children: [

                              SfCircularChart(
                                legend: Legend(isVisible: true),
                                tooltipBehavior: TooltipBehavior(enable: true),

                                series: <PieSeries<SalesData,String>>[

                                  PieSeries<SalesData,String>(

                                    explode: true,
                                    dataSource: inMony,
                                    xValueMapper: (SalesData sales, _) => sales.year,
                                    yValueMapper: (SalesData sales, _) => sales.sales,
                                    dataLabelSettings: const DataLabelSettings(isVisible: true),

                                  ),
                                ],
                              ),
                              SfCartesianChart(

                                legend: Legend(isVisible: true),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                primaryXAxis: CategoryAxis(),

                                series: <SplineSeries<SalesData,String>>[

                                  SplineSeries<SalesData,String>(

                                    width: 5,
                                    name: "In",
                                    dataSource: inMony,
                                    xValueMapper: (SalesData sales, _) => sales.year,
                                    yValueMapper: (SalesData sales, _) => sales.sales,
                                    dataLabelSettings: const DataLabelSettings(isVisible: true),

                                  ),
                                  SplineSeries<SalesData,String>(

                                    width: 5,
                                    animationDuration: 3,
                                    name: "Out",
                                    dataSource: outMony,
                                    xValueMapper: (SalesData sales, _) => sales.year,
                                    yValueMapper: (SalesData sales, _) => sales.sales,
                                    dataLabelSettings: const DataLabelSettings(isVisible: true),

                                  ),
                                ],
                              ),
                              SfCartesianChart(

                                legend: Legend(isVisible: true),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                primaryXAxis: CategoryAxis(),
                                series: <SplineAreaSeries<SalesData,String>>[

                                 SplineAreaSeries<SalesData,String>(

                                    name: "In - Maher(kid)",
                                    dataSource: inMonyKid,
                                    xValueMapper: (SalesData sales, _) => sales.year,
                                    yValueMapper: (SalesData sales, _) => sales.sales,
                                    dataLabelSettings: const DataLabelSettings(isVisible: true),

                                  ),
                                  SplineAreaSeries<SalesData,String>(

                                    animationDuration: 3,
                                    name: "Out - Maher(kid)",
                                    dataSource: outMonyKid,
                                    xValueMapper: (SalesData sales, _) => sales.year,
                                    yValueMapper: (SalesData sales, _) => sales.sales,
                                    dataLabelSettings: const DataLabelSettings(isVisible: true),

                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        PageViewDotIndicator(

                            currentItem: selectedPage!,
                            count: 3,
                            unselectedColor: Colors.grey,
                            selectedColor: myColors.blu),

                        SizedBox(
                          height: myApplication.hightClc(20, context),
                        ),

                        Row(
                          children: [

                            Container(
                              height: myApplication.hightClc(62, context),
                              width: myApplication.widthClc(170, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: myColors.shadow,
                                    blurRadius: 10,
                                    offset: const Offset(1, 1.5),
                                    spreadRadius: 10,
                                  )
                                ],
                              ),
                              child: Row(

                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,

                                children: [

                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: myColors.blu.withOpacity(0.2),
                                    ),

                                    height:
                                        myApplication.hightClc(49, context),
                                    width:
                                        myApplication.widthClc(49, context),
                                    child: Center(
                                      child: Transform.rotate(
                                          angle: 90 * math.pi / 180,
                                          child: Icon(
                                            Icons.arrow_right_alt_sharp,
                                            size: myApplication.widthClc(
                                                30, context),
                                            color: myColors.blu,
                                          )),
                                    ),

                                  ),

                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [

                                      Text(
                                        "EGP 5245.3",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),

                                      Text(
                                        "income",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: myApplication.widthClc(10, context),
                            ),

                            Container(

                              height: myApplication.hightClc(62, context),
                              width: myApplication.widthClc(170, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor,
                                boxShadow: [

                                  BoxShadow(
                                    color: myColors.shadow,
                                    blurRadius: 10,
                                    offset: const Offset(1, 1.5),
                                    spreadRadius: 10,
                                  )
                                ],
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [

                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red.withOpacity(0.2),
                                    ),

                                    height:
                                        myApplication.hightClc(49, context),
                                    width:
                                        myApplication.widthClc(49, context),

                                    child: Center(
                                      child: Transform.rotate(
                                          angle: -90 * math.pi / 180,
                                          child: Icon(
                                            Icons.arrow_right_alt_sharp,
                                            size: myApplication.widthClc(
                                                30, context),
                                            color: Colors.red,
                                          )),
                                    ),
                                  ),

                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [

                                      Text(
                                        "EGP 8245.3",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),

                                      Text(
                                        "expense",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
