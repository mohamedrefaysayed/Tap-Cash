import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';
import 'package:tap_cash/helper/constants/myColors.dart';

class confirmButton extends StatelessWidget {

  final ontap;
  final text;
  const confirmButton({Key? key, required this.ontap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: myApplication.hightClc(48, context),
      child:  ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: myColors.blu),
        onPressed: ontap,
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: myApplication.widthClc(14, context)),)),)
    );
  }
}
