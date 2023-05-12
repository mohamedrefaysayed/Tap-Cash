// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/presentation/splash/splash.dart';

class splashLogo extends StatefulWidget {
  const splashLogo({Key? key}) : super(key: key);

  @override
  State<splashLogo> createState() => _splashLogoState();
}

class _splashLogoState extends State<splashLogo> {


  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {myApplication.push_fade(context,const splash());});
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
          child: SizedBox(
            height: myApplication.hightClc(260, context),
            width: myApplication.widthClc(260, context),
            child: ClipOval(
                child: Center(
                  child: Transform.scale(
                    scale: 1.6,
                    child: Column(
                      children: [
                        SizedBox(height: myApplication.hightClc(10, context),),
                        FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset("assets/TapCahA.gif",width: 250,height: 250,),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
      ),
    );
  }
}
