import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';

class nullButton extends StatelessWidget {

  final text;
  const nullButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: myColors.blu.withOpacity(0.2),
        borderRadius: BorderRadius.circular(75),
      ),
        width: double.infinity,
        height: myApplication.hightClc(48, context),
        child:  Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: myApplication.widthClc(14, context)),))
    );
  }
}
