// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tap_cash/data/chach_helper.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/presentation/auth/sign_Up.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';
import 'package:tap_cash/presentation/onBoard/Onboard.dart';


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with TickerProviderStateMixin{

  AnimationController? Controller;

  Animation<Offset>? SplashAnimation;

  bool isanimating = false;

  @override
  void initState(){

    Controller = AnimationController(
        vsync: this,duration: const Duration(milliseconds: 500));
    SplashAnimation = Tween<Offset>(
        begin: const Offset(0.0,0.6),
        end: Offset.zero
    ).animate(CurvedAnimation(parent: Controller!, curve: Curves.linear));
    Controller!.forward();
    Timer(const Duration(milliseconds: 1500), (){
      var firsTime = CahchHelper.getData(key: "firtTime") ?? true;
      var isLogin = CahchHelper.getData(key: "isLogin") ?? false;
      firsTime
      ? {myApplication.navigateToRemove(context, onBoard()),CahchHelper.saveData(key: "firtTime", value: false)}
      : {
        isLogin
        ? myApplication.navigateToRemove(context, const mainScreen())
        : myApplication.navigateToRemove(context, const signUp())
      };

    });


    super.initState();
  }
  @override
  void dispose() {
    Controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.blu,
        body: SlideTransition(
          position: SplashAnimation!,
          child:SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome To",
                    style: TextStyle(fontWeight: FontWeight.w700,
                        fontSize: myApplication.widthClc(35, context),
                        color: Colors.white),),
                  Text("Tap Cash",
                    style: TextStyle(fontWeight: FontWeight.w900,
                        fontSize: myApplication.widthClc(50, context),
                        color: Colors.white),),

                ],
              )),

        ),


    );
  }
}
