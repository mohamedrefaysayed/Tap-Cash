import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/helper/widgets/bottomNav_NotchClip.dart';
import 'package:tap_cash/presentation/auth/sign_Up.dart';
import 'package:tap_cash/presentation/dashBoard/dashBoardMain.dart';
import 'package:tap_cash/presentation/e_Wallet/walletMain.dart';
import 'package:tap_cash/presentation/home/home.dart';
import 'package:tap_cash/presentation/more/moreMain.dart';
import 'package:tap_cash/presentation/qrCode/scanQR.dart';



class mainScreen extends StatefulWidget  {
   mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> with TickerProviderStateMixin{

  TabController? _tabController;
  String qrCode = "";

  @override
  Widget build(BuildContext context) {

    _tabController = TabController(length: 5,vsync: this);
    return  WillPopScope(
      onWillPop: () => myApplication.onWillPop(context),
      child: Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            home(),
            dashBoardMain(),
            SizedBox(),
            walletMain(),
            moreMain(),          ],
        ),
        extendBody: true,

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: (){
            myApplication.navigateTo(scanQr(), context);
          },
          child: Container(
            height: 70,
            width: 70,
            child: Stack(
              children: [
                Image.asset("assets/bottomNavFloat/bottomNavBg.png",height: 70,width: 70,),
                Center(child: Image.asset("assets/bottomNavFloat/scan.png",height: 23,width: 23,)),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(1, 1.5),
                  spreadRadius: 3,
                )
              ]
          ),

          child: BottomAppBar(
            height: 80,
            notchMargin: 5,
            shape: StreamlinedNotchClipper(),
            elevation: 10,
            child: IconTheme(
              data: IconThemeData(color: Colors.white),
              child: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 17),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                labelColor: myColors.blu,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: [
                  Tab(
                  icon: Stack(
                    children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Icon(Icons.home_outlined,size: 36)),
                      Align(
                        alignment: Alignment.bottomCenter,
                          child: Text("home")),
                    ],
                  ),
                  ),
                  Tab(
                    icon: Container(
                      width: 80,
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Icon(Icons.stacked_bar_chart_outlined,size: 33)),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Text("dash board")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: myApplication.widthClc(20, context),),
                  Tab(
                    icon: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Icon(FontAwesomeIcons.wallet,size: 30)),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Text("wallet")),
                      ],
                    ),
                  ),
                  Tab(
                    icon: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Icon(Icons.more_horiz,size: 36)),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Text("more")),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}

