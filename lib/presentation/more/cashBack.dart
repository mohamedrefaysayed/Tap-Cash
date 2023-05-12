// ignore_for_file: camel_case_types, duplicate_ignore, file_names, must_be_immutable

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class cashBack extends StatelessWidget {
  cashBack({Key? key}) : super(key: key);


  int points = 0;

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
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cash Back",
                        style: TextStyle(
                            fontSize: myApplication.widthClc(24, context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(49, context),
                    ),
                    const Text(
                      "You have cash back EGP : 100 ",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(40, context),
                    ),
                    Text(
                      "$points Points",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(21, context),
                    ),
                    const Text(
                      "you can convert up to 0 LE",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(30, context),
                    ),
                    Container(
                      width: myApplication.widthClc(192, context),
                      height: myApplication.hightClc(48, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        color: myColors.blu,
                      ),
                      child: Center(
                        child: Text(
                          "Convert my points",style: TextStyle(fontWeight: FontWeight.w400,
                        fontSize: myApplication.widthClc(14, context),color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(109, context),
                    ),
                    Container(
                      height: myApplication.hightClc(123, context),
                      width: myApplication.widthClc(396, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: myColors.shadow,
                            blurRadius: 10,
                            offset: const Offset(1, 1.5),
                            spreadRadius: 10,
                          )
                        ],
                      ),
                      child: Container(
                        margin:  EdgeInsets.symmetric(
                            horizontal: myApplication.widthClc(21, context),vertical: myApplication.hightClc(15, context)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Food & Beverage",style: TextStyle(fontSize: myApplication.widthClc(16, context),
                            fontWeight: FontWeight.w600),),
                            SizedBox(height: myApplication.hightClc(20, context),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap:()async{
                                    await launchUrlString("https://egypt.kfc.me/ar/home",mode: LaunchMode.externalApplication);
                                  },
                                    child: Image.asset("assets/images/Kfc.png",height: myApplication.hightClc(50, context),)),
                                GestureDetector(
                                    onTap:()async{
                                      await launchUrlString("https://www.talabat.com/ar/egypt",mode: LaunchMode.externalApplication);
                                    },                                    child: Image.asset("assets/images/talabat.png",height: myApplication.hightClc(50, context),)),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: myApplication.hightClc(16, context),
                    ),
                    Container(
                      height: myApplication.hightClc(123, context),
                      width: myApplication.widthClc(396, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: myColors.shadow,
                            blurRadius: 10,
                            offset: const Offset(1, 1.5),
                            spreadRadius: 10,
                          )
                        ],
                      ),
                      child: Container(
                        margin:  EdgeInsets.symmetric(
                            horizontal: myApplication.widthClc(21, context),vertical: myApplication.hightClc(15, context)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shopping",style: TextStyle(fontSize: myApplication.widthClc(16, context),
                                fontWeight: FontWeight.w600),),
                            SizedBox(height: myApplication.hightClc(20, context),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    onTap:()async{
                                      await launchUrlString("https://www.amazon.com/",mode: LaunchMode.externalApplication);
                                    },
                                    child: Image.asset("assets/images/amazon.png",height: myApplication.hightClc(50, context),)),
                                GestureDetector(
                                    onTap:()async{
                                      await launchUrlString("https://www.amazon.com/",mode: LaunchMode.externalApplication);
                                    },
                                    child: Image.asset("assets/images/souq.png",height: myApplication.hightClc(50, context),)),
                                GestureDetector(
                                    onTap:()async{
                                      await launchUrlString("https://www.noon.com/egypt-en/",mode: LaunchMode.externalApplication);
                                    },                                    child: Image.asset("assets/images/noon.png",height: myApplication.hightClc(50, context),)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )));
  }
}
