import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';

class smallButton extends StatelessWidget {

  final ontap;
  final text;
  final color;
  final textcolor;
  const smallButton({Key? key, required this.ontap, required this.text,required this.color,required this.textcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: myApplication.widthClc(170, context),
        height: myApplication.hightClc(56, context),
        child:  ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: ontap,
          child: Center(child: Text(text,style: TextStyle(color: textcolor,fontSize: myApplication.widthClc(14, context),fontWeight: FontWeight.bold  ),)),)
    );
  }
}
