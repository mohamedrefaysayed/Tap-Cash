import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/widgets/bottomSheetWidget.dart';
import 'package:tap_cash/presentation/bIlls/payInternetBill.dart';

class InternetProvider extends StatelessWidget {
  const InternetProvider({Key? key}) : super(key: key);

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
                        "Internet",
                        style: TextStyle(
                            fontSize: myApplication.widthClc(24, context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Hero(
                      tag: "internet",
                      child: ClipRect(
                        child: Container(
                          height: myApplication.hightClc(122, context),
                          width: myApplication.widthClc(122, context),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange.shade100,
                          ),

                          child: Icon(
                            Icons.wifi,
                            size: myApplication.widthClc(80, context),
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(20, context),
                    ),

                    Text(
                      "Pay internet bill",
                      style: TextStyle(
                          fontSize: myApplication.widthClc(24, context),
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(10, context),
                    ),

                    const Text(
                      "Pay internet easily.",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(1, context),
                    ),

                    const Text(
                      "You can pay anytime and anywhere!",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),

                    SizedBox(
                      height: myApplication.hightClc(50, context),
                    ),

                    Column(
                      children: [
                        GestureDetector(

                          onTap: () {
                            myApplication.navigateTo(
                                payInternetBill(), context);
                            },

                          child: bottomSheetWidget(

                              icon: Image.asset(
                                "assets/images/orangeLogo.png",
                                height: myApplication.hightClc(40, context),
                                width: myApplication.widthClc(40, context),
                              ),

                              text: "Orange"),
                        ),

                        GestureDetector(

                          onTap: () {
                            myApplication.navigateTo(
                                payInternetBill(), context);
                            },

                          child: bottomSheetWidget(
                              icon: Image.asset(
                                "assets/images/weLogo.png",
                                height: myApplication.hightClc(40, context),
                                width: myApplication.widthClc(40, context),
                              ),

                              text: "We"),
                        ),
                        GestureDetector(

                          onTap: () {

                            myApplication.navigateTo(
                                payInternetBill(), context);
                            },
                          child: bottomSheetWidget(

                              icon: Image.asset(
                                "assets/images/vodafoneLogo.png",
                                height: myApplication.hightClc(40, context),
                                width: myApplication.widthClc(40, context),
                              ),
                              text: "Vodafon"),
                        ),
                        GestureDetector(
                          onTap: () {
                            myApplication.navigateTo(
                                payInternetBill(), context);                          },
                          child: bottomSheetWidget(
                              icon: Image.asset(
                                "assets/images/etslatLogo.png",
                                height: myApplication.hightClc(40, context),
                                width: myApplication.widthClc(40, context),
                              ),
                              text: "Etisalat"),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            )));
  }
}
