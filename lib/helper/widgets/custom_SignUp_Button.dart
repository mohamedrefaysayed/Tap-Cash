import 'package:flutter/material.dart';
import 'package:tap_cash/helper/MyApplication.dart';

class customSignButton extends StatelessWidget {

  final ontap;
  final iconPath;
  final text;

  const customSignButton({Key? key, required this.ontap, required this.iconPath, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: myApplication.hightClc(48, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(75),
          color: const Color(0xff4F9AFF).withOpacity(0.2),
        ),
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(iconPath,height: 30,),
                SizedBox(width: myApplication.widthClc(10, context),),
                Text(text),
              ],
            )
        ),
      ),
    );
  }
}
