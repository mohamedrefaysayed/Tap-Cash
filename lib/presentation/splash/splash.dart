import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';
import 'package:tap_cash/presentation/main_Screen/mainScreen.dart';


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with TickerProviderStateMixin{
  @override


  Animation<Offset>? _animation;
  Animation<Offset>? _Aanimation;

  bool isanimating = false;

  @override
  void initState(){

    Timer(const Duration(milliseconds: 2000), (){
      myApplication.navigateTo(mainScreen(), context);
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.blu,
        body:Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: myColors.blu,
              ),
            ),
                Center(
              child: SlideTransition(
                position: _Aanimation!,
                child:Hero(
                  tag: "logo",
                  child: Container(),
                ),

              ),
            ),
                SlideTransition(
              position: _animation!,
              child: Container(),

            ),

          ],
        )

    );
  }
}
