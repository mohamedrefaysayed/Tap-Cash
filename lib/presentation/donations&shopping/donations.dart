import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/widgets/bottomSheetWidget.dart';
import 'package:tap_cash/presentation/donations&shopping/donationAmount.dart';

class donations extends StatelessWidget {
  donations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => myApplication.keyboardFocus(context),
        child: WillPopScope(
            onWillPop: () {
              return Future.value(true);
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(leading: myApplication.backIcon(context, () {})),
              body: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Donations",
                          style: TextStyle(
                              fontSize: myApplication.widthClc(24, context),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(35, context),
                    ),
                    Hero(
                      tag: "donation",
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset("assets/home/donation.png",height: myApplication.hightClc(100, context),width: myApplication.widthClc(100, context),),
                      ),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(30, context),
                    ),
                    Text(
                      "Choose the donation",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(30, context),
                    ),
                    Container(
                      height: myApplication.hightClc(450, context),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          GestureDetector(
                            onTap: () {
                              myApplication.navigateTo(
                                  donationAmount(), context);
                            },
                            child: bottomSheetWidget(
                                icon: Image.asset(
                                  "assets/images/75375.png",
                                  height: 40,
                                  width: 40,
                                ),
                                text: "Hospital 57357"),
                          ),
                          GestureDetector(
                            onTap: () {
                              myApplication.navigateTo(
                                  donationAmount(), context);                          },
                            child: bottomSheetWidget(
                                icon: Image.asset(
                                  "assets/images/MaserElkher.png",
                                  height: 40,
                                  width: 40,
                                ),
                                text: "Misr elkheir"),
                          ),
                          GestureDetector(
                            onTap: () {
                              myApplication.navigateTo(
                                  donationAmount(), context);                          },
                            child: bottomSheetWidget(
                                icon: Image.asset(
                                  "assets/images/resala.png",
                                  height: 40,
                                  width: 40,
                                ),
                                text: "Resala"),
                          ),
                          GestureDetector(
                            onTap: () {
                              myApplication.navigateTo(
                                  donationAmount(), context);                          },
                            child: bottomSheetWidget(
                                icon: Image.asset(
                                  "assets/images/aboElreesh.png",
                                  height: 40,
                                  width: 40,
                                ),
                                text: "Abu rish hospital"),
                          ),
                          GestureDetector(
                            onTap: () {
                              myApplication.navigateTo(
                                  donationAmount(), context);                          },
                            child: bottomSheetWidget(
                                icon: Image.asset(
                                  "assets/images/baytElzaka.png",
                                  height: 40,
                                  width: 40,
                                ),
                                text: "Bayt el zakat"),
                          ),
                          GestureDetector(
                            onTap: () {
                              myApplication.navigateTo(
                                  donationAmount(), context);                          },
                            child: bottomSheetWidget(
                                icon: Image.asset(
                                  "assets/images/darElorman.png",
                                  height: 40,
                                  width: 40,
                                ),
                                text: "Dar al orman"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
