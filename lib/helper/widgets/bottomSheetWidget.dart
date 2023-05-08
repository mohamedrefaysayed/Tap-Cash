import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';

class bottomSheetWidget extends StatelessWidget {
  const bottomSheetWidget({Key? key, required this.icon, required this.text}) : super(key: key);

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 396,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 10,
          offset: Offset(1, 1.5),
          spreadRadius: 10,
        )
      ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(width: myApplication.widthClc(25, context),),
          icon,
          SizedBox(width: myApplication.widthClc(25, context),),
          Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
        ],
      )
      );
  }
}