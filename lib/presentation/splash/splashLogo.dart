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
    Timer(Duration(seconds: 2), () {myApplication.push_fade(context,splash());});
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
          child: Container(
            height: 260,
            width: 260,
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
